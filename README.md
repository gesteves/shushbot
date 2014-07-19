# shushbot

A [Slack][slack] bot that discourages people from chatting in a specific channel.

[slack]: https://slack.com

## Why?

We have over 500 people in our #general channel, and since Slack doesn't allow people to leave or mute it, we try to keep the chatter down in that room to avoid distracting everyone. When set up as an outgoing webhook in that room, this bot will politely point people to our other channels when they talk in #general.

## Installation & usage

The simplest way to set it up is using [Heroku][he] & Redis Cloud. Just install the [Heroku Toolbelt][ht], fork & clone the repo, and run:

```
$ heroku create
$ heroku addons:add rediscloud
$ git push heroku master
```

Next, you'll want to set up a Slack [outgoing webhook][ow] to send messages to shushbot. Set it up so it listens to a single channel of your choice, _don't_ set up a keyword, and set the URL to `http://[your-heroku-url]` (you can find out your Heroku URL with `heroku info`).

Finally, you'll have to set up the config vars for your Heroku app. You can set these up in the settings page for your app in the Heroku dashboard, or using the `heroku config:set` [command][cf]. The variables you'll need to set up are:

* `OUTGOING_WEBHOOK_TOKEN`: the token from the outgoing webhook you just set up.
* `BOT_USERNAME`: the name you want the bot to use.
* `BOT_ICON`: the emoji avatar you want to use for your bot.
* `SECONDS_BETWEEN_RESPONSES`: the number of seconds between responses, if you don't want the bot to badger users every time they say something.
* `REDIRECT_CHANNEL`: the Slack channel you want to point your users to after being shushed.

[ht]: https://toolbelt.heroku.com/
[he]: http://www.heroku.com
[ow]: https://slack.com/services/new/outgoing-webhook
[cf]: https://devcenter.heroku.com/articles/config-vars#setting-up-config-vars-for-a-deployed-application

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License 

Copyright (c) 2014, Guillermo Esteves
All rights reserved.

BSD license

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
