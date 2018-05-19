require 'spec_helper'

describe BtsBot::Usagi do
  subject(:usagi) { BtsBot::Usagi.new }

  describe '#describe' do
    it 'returns かわいい' do
      expect(usagi.invoke).to eq('かわいい')
    end
  end
end
