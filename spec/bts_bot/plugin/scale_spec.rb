require 'spec_helper'

describe BtsBot::Plugin::Scale do
  subject(:scale) { BtsBot::Plugin::Scale.new }

  describe '#invoke' do
    context 'when rand() returns 0' do
      before { expect_any_instance_of(Object).to receive(:rand).with(100).and_return(0) }
      it 'returns 0 scale' do
        expect(scale.invoke('foo')).to eq('Your score on the foo scale is: [__________] 0%')
      end
    end

    context 'when rand() returns 100' do
      before { expect_any_instance_of(Object).to receive(:rand).with(100).and_return(100) }
      it 'returns 100 scale' do
        expect(scale.invoke('foo')).to eq('Your score on the foo scale is: [==========] 100%')
      end
    end

    context 'when rand() returns 30' do
      before { expect_any_instance_of(Object).to receive(:rand).with(100).and_return(30) }
      it 'returns 30 scale' do
        expect(scale.invoke('foo')).to eq('Your score on the foo scale is: [==>_______] 30%')
      end
    end

    context 'when rand() returns 55' do
      before { expect_any_instance_of(Object).to receive(:rand).with(100).and_return(55) }
      it 'returns 55 scale' do
        expect(scale.invoke('foo')).to eq('Your score on the foo scale is: [=====>____] 55%')
      end
    end
  end
end
