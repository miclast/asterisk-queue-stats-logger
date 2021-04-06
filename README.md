# asterisk-queue-stats-logger
An application for logging the load on a call center based on asterisk.

Run 'rvm cron setup' then append asterisk crontab running 'crontab -e'

#Sample cron task for asterisk-queue-logger at 6pm every day


Apply new cron settings as root or sudo

'service cron restart'

Then you can check new crontab: 'crontab -u asterisk -l'

You should see something like this:

#sm start rvm

PATH="/usr/local/rvm/gems/ruby-2.7.2/bin:/usr/local/rvm/gems/ruby-2.7.2@global/bin:/usr/local/rvm/rubies/ruby-2.7.2/bin:/usr/local/rvm/gems/ruby-2.7.2/bin:/usr/local/rvm/gems/ruby-2.7.2@global/bin:/usr/local/rvm/rubies/ruby-2.7.2/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/usr/local/rvm/bin:/home/asterisk/.local/bin:/home/asterisk/bin" GEM_HOME='/usr/local/rvm/gems/ruby-2.7.2' GEM_PATH='/usr/local/rvm/gems/ruby-2.7.2:/usr/local/rvm/gems/ruby-2.7.2@global' MY_RUBY_HOME='/usr/local/rvm/rubies/ruby-2.7.2' IRBRC='/usr/local/rvm/rubies/ruby-2.7.2/.irbrc' RUBY_VERSION='ruby-2.7.2'

#sm end rvm

* * * * * /usr/local/bin/call-counter.rb > /dev/null 2>&1

#other asterisk cron jobs

#...

#...



