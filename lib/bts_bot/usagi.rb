module BtsBot
  class Usagi
    def set_callback(bot)
      bot.command :usagi do |e, str|
        invoke
      end
    end

    def invoke
      'かわいい'
    end
  end
end
