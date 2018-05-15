require 'discordrb'

bot = Discordrb::Commands::CommandBot.new(
  client_id: ENV.fetch('CLIENT_ID'),
  token: ENV.fetch('SECRET_TOKEN'),
  prefix: '/',
)

bot.command :echo do |e, str|
  str
end

bot.command :usagi do |e, str|
  'かわいい'
end

bot.run
