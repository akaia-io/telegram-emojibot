require 'require_all'
require 'telegram/bot'
require_rel 'emoji'
require_rel 'tools'
puts 'started successfully'
# token = '' # YOUR API TOKEN GOES BETWEEN THE QUOTES

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    if message.command '/test'
      text = 'bulgakke is ze best'
      bot.respond_to_user(message, text)
      puts 'Test passed, I guess'

    elsif message.command '/get_id'
      if message.reply_to_message
        text = "Your ID is #{message.from.id} \n"
        text += "My ID is #{message.reply_to_message.from.id}"
      else
        text = 'Use this command as a reply to any of my messages'
      end
      
     
      bot.respond_to_user(message, text)

    elsif message.command '/deleting_mode'
      message.chat.emojimode = :deleting if message.from_owner?

    elsif message.command '/editing_mode'
      message.chat.emojimode = :editing if message.from_owner?

    elsif message.command '/skipping_mode'
      message.chat.emojimode = :skipping if message.from_owner?

      # elsif message.command '/something'
      #   `block`
    end # if message.command '/start'

    if message.text
      if bot.self_can_delete_messages?(message) && message.text.has_disallowed?
        case message.chat.emojimode
        when :deleting
          bot.delete(message)

        when :editing
          text = "#{Tools.form_user_link(message, true)}:\n\n"
          text += message.text.allowed
          bot.delete(message)
          bot.send_message(message, text)
        end
      end
    end
  end # bot.listen
end # Client.run