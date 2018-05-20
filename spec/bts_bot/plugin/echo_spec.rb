require 'spec_helper'

describe BtsBot::Plugin::Echo do
  subject(:echo) { BtsBot::Plugin::Echo.new }

  describe '#describe' do
    it 'returns input string' do
      expect(echo.invoke('foo')).to eq('foo')
    end
  end
end
