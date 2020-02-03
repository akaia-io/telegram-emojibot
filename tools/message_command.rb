class String
  def starts_with?(command)
    x = command.length - 1
    return true if chars.slice(0..x).join == command

    false
  end
end

module Telegram
  module Bot
    module Types
      class Message
        def command(expression)
          return false if text.nil?

          text.starts_with?(expression)
        end
      end
    end
  end
end
