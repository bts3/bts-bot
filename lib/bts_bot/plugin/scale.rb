module BtsBot
  module Plugin
    class Scale
      attr_reader :command, :description

      def initialize
        @command = :scale
        @description = 'Randomize a scale for the requested input'
      end

      def set_callback(bot)
        bot.command(@command, description: @description) do |e, str|
          invoke(str)
        end
      end

      def invoke(str)
        score = rand(100)

        if score == 0
          bar = "[__________]"
        elsif score == 100
          bar = "[==========]"
        else
          numthick = (score.to_f / 10).ceil
          bar = "["
          (numthick - 1).times { bar = bar + "=" }
          bar = bar + ">"
          (10 - numthick).times { bar = bar + "_"}
          bar = bar + "]"
        end
        "Your score on the #{str} scale is: #{bar} #{score}%"
      end
    end
  end
end
