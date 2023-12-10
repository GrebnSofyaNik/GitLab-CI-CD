#!/bin/bash

TELEGRAM_API_TOKEN=6897474055:AAGsgj26T_Jzuzoi-tmwfpfG65WF9PvPaqU
CHAT_ID=880761225
TIME=30

URL="https://api.telegram.org/bot$TELEGRAM_API_TOKEN/sendMessage"
TEXT="Deploy status: $1  %0A%0AProject:+$CI_PROJECT_NAME%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/"

curl -s --max-time $TIME -d "chat_id=$CHAT_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
echo 'notify fini'

