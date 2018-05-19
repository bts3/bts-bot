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
      Iokuji.new(@iokuji_file_path).set_callback(@bot)

      @bot.command :echo do |e, str|
        str
      end

      @bot.command :usagi do |e, str|
        'かわいい'
      end
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
  end
end
