module.exports = (robot) ->
  require('hubot-arm') robot
  {parseString} = require 'xml2js'
  robot.respond /book (.+)$/i, (msg) ->
    key = msg.match[1]
    msg.send "http://alert.shop-bell.com/search/?safesearch=&safesearch[=1&Books=1&BrowseNode=&Title=#{key}&Author=&Publisher=&BooksSelectedBn=%E6%8C%87%E5%AE%9A%E3%81%AA%E3%81%97&bnBooksLv_1=]"

