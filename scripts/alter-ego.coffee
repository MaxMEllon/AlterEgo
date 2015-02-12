cronJob = require('cron').CronJob

module.exports = (robot) ->
  robot.hear /疲れた/i, (msg) ->
    msg.send "もうちょっとがんばろや？な？"

  robot.hear /風邪/i, (msg) ->
    msg.send "体には気をつけるんやで？"

  robot.hear /おう/i, (msg) ->
    msg.send "ん？" if Math.random() > 0.5

  robot.hear /あ．．．/i, (msg) ->
    msg.send "（察し）"

  robot.hear /33-4/i, (msg) ->
    msg.send "なんでや！"

  robot.hear /なんでや/i, (msg) ->
    msg.send "阪神関係ないやろ！"

  robot.hear /阪神関係ない/i, (msg) ->
    msg.send "なんJ民かよ"

  robot.hear /2-4-11/i, (msg) ->
    msg.send "ｶｰﾝｶｰﾝｶｰﾝ"

  robot.hear /寒い/i, (msg) ->
    msg.send "ヒータ付けとこか？"

  robot.hear /暑い/i, (msg) ->
    msg.send "クーラー付けとこか？"

  robot.hear /sage/i, (msg) ->
    msg.send "sageんなageろ"

  robot.hear /mail/i, (msg) ->
    msg.send "mozi_kke@excite.co.jp"

  robot.hear /こんな世の中じゃ/i, (msg) ->
    msg.send "ポイズン"

  robot.hear /info/i, (msg) ->
    msg.send """
    ---------------------------------------------
    - # log
    - http://v157-7-131-230.myvps.jp:3000/irclogs/channels
    ---------------------------------------------
    - # wether
    - AlterEgo 天気 <場所>
    ---------------------------------------------
    - # news
    - AlterEgo news
    ---------------------------------------------
    - # youtube
    - AlterEgo youtube <word> # 検索結果を表示
    ---------------------------------------------
    - # task
    - AlterEgo task add <タスク名>
    - AlterEgo tasks
    - AlterEgo task del <タスク番号>
    ---------------------------------------------
    - # niconico
    - AlterEgo nico sm******
    - AlterEgo nico ranking
    ---------------------------------------------
    - # find-work
    - AlterEgo find
    ---------------------------------------------
    - # web-manga
    - AlterEgo web-manga
    ---------------------------------------------
    """
