# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bts_bot/version'

Gem::Specification.new do |spec|
  spec.name          = 'bts_bot'
  spec.version       = BtsBot::VERSION
  spec.authors       = ['mozamimy']
  spec.email         = ['alice@mozami.me']

  spec.summary       = 'A discord bot for bTS3 (balancerensa.net)'
  spec.description   = 'A discord bot for bTS3 (balancerensa.net)'
  spec.homepage      = 'https://github.com/mozamimy/bts_bot'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_dependency 'discordrb'
end
