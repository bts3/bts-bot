module BtsBot
  class Echo
    def set_callback(bot)
      bot.command :echo do |e, str|
        invoke(str)
      end
    end

    def invoke(str)
      str
    end
  end
end
