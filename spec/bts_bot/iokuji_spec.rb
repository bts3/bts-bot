require 'spec_helper'
require 'yaml'

describe BtsBot::Iokuji do
  let(:iokuji_file_path) { File.expand_path('../../../config/iokuji.yml', __FILE__) }
  let(:iokuji_spec) { YAML.load_file(iokuji_file_path) }
  subject(:iokuji) { BtsBot::Iokuji.new(iokuji_file_path) }

  describe '#invoke' do
    it 'returns first omikuji result' do
      iokuji_list = iokuji_spec.fetch('iokuji')

      expectation = "【#{iokuji_list[0].fetch('subject')}】#{iokuji_list[0].fetch('body')}"
      result = iokuji.invoke(nil, 1)

      expect(iokuji.invoke(nil, 1)).to eq(expectation)
    end
  end
end
