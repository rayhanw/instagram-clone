require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { create(:comment) }

  describe "#user" do
    it 'should have a user' do
      expect(comment.user).not_to be_nil
    end
  end

  describe "#post" do
    it 'should have a post' do
      expect(comment.post).not_to be_nil
    end
  end

  describe "#content" do
    it 'should have a content' do
      expect(comment.content).not_to be_nil
      expect(comment.content).not_to be_empty
    end
  end
end
