module BtsBot
  class Echo
    attr_reader :command, :description

    def initialize
      @command = :echo
      @description = '入力した発言をそのままオウム返しします'
    end

    def set_callback(bot)
      bot.command(@command, description: @description) do |e, str|
        invoke(str)
      end
    end

    def invoke(str)
      str
    end
  end
end
