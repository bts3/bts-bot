module BtsBot
  module Plugin
    class Usagi
      attr_reader :command, :description

      def initialize
        @command = :usagi
        @description = 'かわいい と返します (動作確認用)'
      end

      def set_callback(bot)
        bot.command(@command, description: @description) do |e, str|
          invoke
        end
      end

      def invoke
        'かわいい'
      end
    end
  end
end
