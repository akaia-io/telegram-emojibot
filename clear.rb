require 'telegram/bot'
proxy = 'https://176.113.157.149:31195/'
token = '1043894792:AAFvVjoNgTkTLEELc-JiAtHt-CibRdSrGoc'
puts 'The clearing program started'

Telegram::Bot::Client.run(token) do |bot|
  puts 'Connected to Telegram'
  bot.listen do |message|
    puts 'Received a message'
    if message.text.nil? == false
      if message.text.include? '/start'
        bot.api.send_message(chat_id: message.chat.id, text: 'Maintenance mode enabled')
        puts '/start received'
      end
    end
  end
end
