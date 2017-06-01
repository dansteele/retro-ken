require 'spec_helper'

RSpec.describe Message do
  describe 'bulk messages' do

    let(:single) { '+ Hello!' }
    let(:multi) { "#{single}\n- Sad" }

    it 'detects if multiple messages are passed' do
      expect(Message.contains_many?(single)).to be false
      expect(Message.contains_many?(multi)).to be true
    end

    it 'parses multiple messages' do
      expect(Message.split_messages(single)).to eq []
      expect(Message.split_messages(multi)).to eq [single, "\n- Sad"]
    end
  end
end
