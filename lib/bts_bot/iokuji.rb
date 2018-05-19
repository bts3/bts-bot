require 'yaml'

module BtsBot
  class Iokuji
    attr_reader :command, :description

    def initialize(iokuji_file_path)
      iokuji_file_path ||= File.expand_path('../../../config/iokuji.yml', __FILE__)
      @iokuji_spec = YAML.load_file(iokuji_file_path)

      @command = :iokuji
      @description = '今日の運勢を占います'
    end

    def set_callback(bot)
      bot.command(@command, description: @description) do |e, index|
        invoke(e, index)
      end
    end

    def invoke(e, index)
      index = index.to_i
      iokuji = if valid_index?(index.to_i)
        @iokuji_spec.fetch('iokuji')[index - 1]
      else
        @iokuji_spec.fetch('iokuji').sample
      end
      "【#{iokuji.fetch('subject')}】#{iokuji.fetch('body')}"
    end

    private

    def valid_index?(index)
      index > 0 && index <= @iokuji_spec.fetch('iokuji').length
    end
  end
end
