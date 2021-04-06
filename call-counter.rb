#!/usr/bin/env ruby
# frozen_string_literal: true

require 'logger'
require 'ruby-asterisk'
ASTER = '127.0.0.1'
PORT = 5038
USER = 'some_user'
PASS = 'some_password'
DEBUG = true

begin
  logger = Logger.new('/var/log/asterisk/c-c.log', 'monthly')

  @ami = RubyAsterisk::AMI.new(ASTER, PORT)
  @ami.login(USER, PASS)

  # console, log
  def message(word, logging)
    p word if DEBUG
    logging.info word
  end

  c = @ami.command('core show calls')

['call ', 'calls'].each do |event|
  lines = c.data.split("\n")
  lines.each do |line|
    result = result + line + ". "  if line.include? event
  end
end  

2.times {result.slice!("Output: ")}
message result, logger

  q = @ami.queue_status
  message q.message, logger

  resp = q.data.split("\n")

  queues = []

  resp.each do |r|
    queues << r if r.include? 'Queue:'
  end

  queues.uniq!
  queues.delete('Queue: default')

  queues.each do |queue|
    queue.sub!('Queue: ', '')
  end

queues.sort!

callers = []

queues.each do |v|
  callers << v
  calls = @ami.queue_summary(v).data.split("\n")
  calls.each do |c|
    callers << c if c.include? 'Callers:'
  end
end

message callers.join(' '), logger

rescue StandardError => e
  message e, logger
end
