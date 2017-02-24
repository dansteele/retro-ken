require 'spec_helper'

RSpec.describe Retrospective do
  describe 'after a retrospective' do
    before { SpecHelper.setup_retrospective }

    describe 'summary' do
      subject { Retrospective.summary.map(&:first).map(&:second) }
      it 'prints reactions in order of most reacted-to' do
        expect(subject).to include(Message.where.not(reactions_count: 0).pluck(:message).first)
        expect(subject).to_not include(Message.where(reactions_count: 0).pluck(:message).first)
      end

    end
  end

end
