require 'spec_helper'

RSpec.describe Message do
  describe '#contains_many?' do
    it 'detects if multiple messages are passed' do
      message = '+ Hello'
      expect(Message.contains_many?(message)).to be false
      message << '\n- Another thing'
      expect(Message.contains_many?(message)).to be true
    end
  end
end
