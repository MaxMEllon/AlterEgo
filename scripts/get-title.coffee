# Description:
#   URLからtitle要素を取得してつぶやく。
#
# Commands:
#  url title, but if page's char-set except UTF-8,characters were garbled.

cheerio = require 'cheerio'
request = require 'request'
iconv = require "iconv"
module.exports = (robot) ->
  robot.hear /https?:\/\/\S+/i, (msg) ->

    url = msg.match[0]
    options =
      url: url
      timeout: 2000
      encoding: "binary"
      headers: {'user-agent': 'node title fetcher'}

    request options, (error, response, body) ->
      conv = new iconv.Iconv(getCharset(body),'UTF-8//TRANSLIT//IGNORE')
      body = new Buffer(body, 'binary')
      body = conv.convert(body).toString()
      $ = cheerio.load body
      title = $('title').text().replace(/\n/g, '')
      if title isnt null && title isnt "" && title isnt "401 Unauthorized"
        msg.send(title)
      else

getCharset = (body) ->
  bin = body.toString('binary')
  re = bin.match(/<meta\b[^>]*charset=["']?([\w\-]+)/i)
  if re
    charset = re[1]
  else
    charset = "utf-8"
  charset
