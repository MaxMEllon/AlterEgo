module.exports = (robot) ->
  require('hubot-arm') robot
  {parseString} = require 'xml2js'
  moment = require 'moment'

  robot.respond /find/i, (res) ->
    res.robot.arm('request')
      url: 'http://www.find-job.net/startup/feed/'
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
      res.send 'find-job: error'
