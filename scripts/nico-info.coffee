module.exports = (robot) ->
  require('hubot-arm') robot
  {parseString} = require 'xml2js'
  moment = require 'moment'

  robot.respond /nico (.*)$/i, (msg) ->
    key = msg.match[1]
    msg.robot.arm('request')
      url: "http://ext.nicovideo.jp/api/getthumbinfo/#{key}"
    .then (r)->
      parseString r.body, (err, parsed) ->
        message = parsed.nicovideo_thumb_response.thumb
          .map (i) ->
            title: i.title[0]
            link: i.watch_url[0]
          .map (i) ->
            "#{i.title} : #{i.link}"
          .join '\n'
        msg.send message
    , (e) ->
      robot.logger.error e
      msg.send 'nico-info: error'

  robot.respond /nico ranking (.*)|nico ranking$/i, (msg) ->
    num = 10 if ! num = msg.match[1]
    cnt = 0
    msg.robot.arm('request')
      url: "http://www.nicovideo.jp/ranking/fav/daily/all?rss=2.0&lang=ja-jp"
    .then (r)->
      parseString r.body, (err, parsed) ->
        message = parsed.rss.channel[0].item
          .map (i) ->
            title: i.title[0]
            link: i.link[0]
          .map (i) ->
            "#{i.title} : #{i.link}"
          .join '\n'
        arr = message.split("\n")
        for i in arr
          cnt++
          msg.send i
          break if cnt >= num
    , (e) ->
      robot.logger.error e
      msg.send 'nico-info: error'

