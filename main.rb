require 'require_all'
require 'telegram/bot'
require_rel 'emoji'
require_rel 'tools'

token = '1043894792:AAFvVjoNgTkTLEELc-JiAtHt-CibRdSrGoc' # YOUR API TOKEN GOES BETWEEN THE QUOTES

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    if message.command '/start'
      text = 'Greetings, I am EmojiBot2020'
      bot.send_message(message, text)

    elsif message.command '/get_id'
      if message.reply_to_message
        text = "Your ID is #{message.from.id} \n"
        text += "My ID is #{message.reply_to_message.from.id}"
      else
        text = 'Use this command as a reply to any of my messages'
      end
      
=begin      
      bot.respond_to_user(message, text)

    elsif message.command '/deleting_mode'
      Emoji.mode = :deleting if message.from_owner?

    elsif message.command '/editing_mode'
      Emoji.mode = :editing if message.from_owner?

    elsif message.command '/skipping_mode'
      Emoji.mode = :skipping if message.from_owner?

      # elsif message.command '/something'
      #   `block`
    end # if message.command '/start'

    if message.text
      if bot.self_can_delete_messages?(message) && message.text.has_disallowed?
        case Emoji.mode
        when :deleting
          bot.delete(message)

        when :editing
          text = "#{Tools.form_user_link(message, true)}:\n\n"
          text += message.text.allowed
          bot.delete(message)
          bot.send_message(message, text)
        end
      end
=end
    end
  end # bot.listen
end # Client.run
