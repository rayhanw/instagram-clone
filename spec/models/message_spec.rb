require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:message) { create(:message) }
  let(:invalid_message) { build(:message, content: "") }

  describe "#author" do
    it 'should have an author' do
      expect(message.author).not_to be_nil
      expect(message.author.class).to be User
    end
  end

  describe "#content" do
    it 'should have a content' do
      expect(message.content).not_to be_empty
    end

    it 'should not accept empty message' do
      expect(invalid_message.valid?).to be false
    end
  end

  describe "#direct_message" do
    it 'should have a direct message' do
      expect(message.direct_message).not_to be_nil
      expect(message.direct_message.class).to be DirectMessage
    end
  end
end
