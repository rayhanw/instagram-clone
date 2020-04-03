require 'rails_helper'

RSpec.describe DirectMessage, type: :model do
  let(:direct_message) { create(:direct_message) }

  describe "#sender" do
    it 'should have a sender' do
      expect(direct_message.sender).not_to be_nil
    end

    it 'should be a User instance' do
      expect(direct_message.sender.class).to be User
    end
  end

  describe "#receiver" do
    it 'should have a receiver' do
      expect(direct_message.receiver).not_to be_nil
    end

    it 'should be a User instance' do
      expect(direct_message.receiver.class).to be User
    end
  end

  describe "#sender <-> #receiver" do
    it 'should be different sender and receiver' do
      expect(direct_message.sender).not_to eq direct_message.receiver
    end
  end
end
