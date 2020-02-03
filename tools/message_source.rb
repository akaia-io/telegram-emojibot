module Telegram
  module Bot
    module Types
      class Message
        def from_owner?
          return true if self.from.id == Tools::OWNER_ID

          false
        end

        def from_self?
          return true if self.from.id == Tools::BOT_ID
        end

        def from_admin?(bot)
          return true if bot.user_admin?(self, self.from.id)

          false
        end

        def from_creator?(bot)
          return true if bot.user_creator?(self, self.from.id)

          false
        end
      end
    end
  end
end