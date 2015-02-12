# Description:
# Output ｶﾞｯ
#
# Commands:
# ぬるぽ | nurupo
#
# Notes:
# inspired by the article below
# http://nanapi.co.jp/blog/2014/06/04/slack_with_hubot/
module.exports = (robot) ->
  robot.hear /ぬるぽ|nurupo/, (msg) ->
    msg.send """

      Λ＿Λ     ＼＼
    （ ・∀・）   | | ｶﾞｯ
   と       ）   | |
     Ｙ /ノ     人
      / ）     <  >  _Λ∩
   ＿/し' ／／  Ｖ｀Д´）/
   （＿フ彡            / ←>>@#{msg.message.user.name}
   """
