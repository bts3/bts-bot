require 'spec_helper'

describe BtsBot::Echo do
  subject(:echo) { BtsBot::Echo.new }

  describe '#describe' do
    it 'returns input string' do
      expect(echo.invoke('foo')).to eq('foo')
    end
  end
end
