require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:message) { create(:message) }

  describe "#author" do
    it 'should have an author' do
      expect(message.author).not_to be_nil
      expect(message.author.class).to be User
    end
  end
end
