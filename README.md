SETUP:

# NOT TESTED FOR BUGS YET

 - in `main.rb`, add your Telegram Bot API Token (from @BotFather) at the line 6
 - in `tools/useful_ids.rb`, assign your account ID (not necesserily the one you created the bot from; any account you consider to be your main) and the account ID of your bot
 - if you don't know the IDs, go to the chat with your bot, say '/start' and use the command '/get_id' on any of its messages
 - run the `main.rb`
 - if the Telegram servers are blocked, you can pass your proxy as an argument in `main.rb:8`: `(token, url: 'https://proxy.example.com')`
 - make your bot an admin in the chat, give it the right to delete messages

 # TODO: make an actual readme