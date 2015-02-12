#!/bin/sh
BOT_ROOT=/home/maxmellon/work/coffee/bot

# IRC標準情報
export HUBOT_IRC_SERVER="157.7.131.230"
export HUBOT_IRC_PORT="6667"
export HUBOT_IRC_USERNAME="AlterEgo"
export HUBOT_IRC_SEND_NOTICE_MODE="true"
# IRCサーバがログインパスワードを要求する場合
export HUBOT_IRC_PASSWORD="hoge"
export HUBOT_IRC_ROOMS="#hoge"
export HUBOT_IRC_NICK="AlterEgo"
# logbot
export IRCLOGS_PORT=3000
export IRCLOGS_FOLDER="/home/maxmellon/work/coffee/bot/logs"

# -nオプションで付けた名前で呼ぶとBOTが反応します
sh ./bin/hubot -a irc -n AlterEgo

case $1 in
  "start" | "stop" | "restart" )
    forever $1 --pidFile $BOT_ROOT/AlterEgo.pid -l $BOT_ROOT/AlterEgo.log -a -v -c /bin/sh $BOT_ROOT/bin/hubot -a irc -n AlterEgo
    ;;
  * )
    echo "Usage: run.sh {start|stop|restart}"
    ;;
esac
