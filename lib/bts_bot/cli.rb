require 'bts_bot'
require 'discordrb'
require 'optparse'

module BtsBot
  class CLI
    def self.start(argv)
      new(argv).run
    end

    def initialize(argv)
      @argv = argv.dup
      parser.parse!(@argv)

      @bot = Discordrb::Commands::CommandBot.new(
        client_id: ENV.fetch('CLIENT_ID'),
        token: ENV.fetch('SECRET_TOKEN'),
        prefix: '!',
      )

      load_plugins
    end

    def run
      @bot.run
    end

    private

    def parser
      @parser ||= OptionParser.new do |opts|
        opts.banner = 'bts_bot'
        opts.version = BtsBot::VERSION
        opts.on('-i', '--iokuji=FILE', 'The iokuji spec file path') { |i| @iokuji_file_path = i }
      end
    end

    def load_plugins
      plugins = [
        Iokuji.new(@iokuji_file_path),
        Echo.new,
        Usagi.new,
      ]
      plugins.each { |p| p.set_callback(@bot) }
    end
  end
end
