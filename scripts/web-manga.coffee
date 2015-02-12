module.exports = (robot) ->
  require('hubot-arm') robot
  {parseString} = require 'xml2js'
  moment = require 'moment'

  robot.respond /web-manga/i, (res) ->
    res.robot.arm('request')
      url: 'http://webmanga.info/feed.xml'
    .then (r) ->
      parseString r.body, (err, parsed) ->
        message = parsed.feed.entry
          .map (i) ->
            title: i.title[0]
            summary: i.summary
          .map (i) ->
            "#{i.title} : #{i.summary}"
          .join '\n'
        res.send message
    , (e) ->
      robot.logger.error e
      res.send 'web-manga: error'
