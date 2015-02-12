# Description
# A Hubot script that display the latest news in yahoo news feed.
#
# Dependencies:
# None
#
# Configuration:
# "hubot-arm": "git://github.com/bouzuya/hubot-arm",
# "hubot-request-arm": "git://github.com/bouzuya/hubot-request-arm",
# "moment": "^2.8.2",
# "xml2js": "^0.4.4"
#
# Commands:
# hubot yahoo-now - display the latest news in yahoo news feed.
#
# Author:
# bouzuya <m@bouzuya.net>
#
# https://github.com/bouzuya/hubot-yahoo-now/blob/master/src/scripts/yahoo-now.coffee

module.exports = (robot) ->
  require('hubot-arm') robot
  {parseString} = require 'xml2js'
  moment = require 'moment'

  robot.respond /news/i, (res) ->
    res.robot.arm('request')
      url: 'http://rss.dailynews.yahoo.co.jp/fc/domestic/rss.xml'
    .then (r) ->
      parseString r.body, (err, parsed) ->
        message = parsed.rss.channel[0].item
          .map (i) ->
            title: i.title[0]
            link: i.link[0]
            pubDate: moment(i.pubDate[0])
          .map (i) ->
            "#{i.title} : #{i.link}"
          .join '\n'
        res.send message
    , (e) ->
      robot.logger.error e
      res.send 'yahoo-now: error'
