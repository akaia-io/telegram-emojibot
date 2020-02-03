require 'telegram/bot'

puts 'The clearing program started'

Telegram::Bot::Client.run('1043894792:AAFvVjoNgTkTLEELc-JiAtHt-CibRdSrGoc') do |bot|
  puts 'Connected to Telegram'

  bot.listen do |message|
    if message.text.nil? == false
      if message.text.include? '/start'
        bot.api.send_message(chat_id: message.chat.id, text: 'Maintenance mode enabled')
        puts '/start received'
      end
    end
  end
end
