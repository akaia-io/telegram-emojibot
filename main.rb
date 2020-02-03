require 'require_all'
require 'telegram/bot'
require_rel 'emoji'
require_rel 'tools'

token = '' # YOUR API TOKEN GOES BETWEEN THE QUOTES

Telegram::Bot::Client.run(token) do |bot|

  bot.listen do |message|
    if message.text
      case Emoji.mode
      when :deleting
        if bot.self_can_delete_messages?(message) && message.text.has_disallowed?
          bot.delete(message)
        end
          
      when :editing
        if bot.self_can_delete_messages?(message) && message.text.has_disallowed?
          text = "#{Tools.form_user_link(full_name = true)} said:\n" 
          text += message.text.allowed
          bot.delete(message)
          bot.send_message(message, text)
        end
      end
    end

    if message.command '/start'
      text = 'Вечер в палату, пациенты!'
      bot.send_message(message, text)

    elsif message.command '/get_id'
      if message.reply_to_message
        text = "Your ID is #{message.from.id} \n"
        text += "My ID is #{message.reply_to_message.from.id}"
        bot.respond_to_user(message, text)
      else 
        text = 'Use this command as a reply to any of my messages'
        bot.respond_to_user(message, text)
      end

    elsif message.command '/deleting_mode' && message.from_owner?
      Emoji.mode = :deleting

    elsif message.command '/editing_mode' && message.from_owner?
      Emoji.mode = :editing

    elsif message.command '/skipping_mode' && message.from_owner?
      Emoji.mode = :skipping

    # elsif message.command '/something'
    #   `block`
    end # if message.command '/start'
  end # bot.listen
end # Client.run