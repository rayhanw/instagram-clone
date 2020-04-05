require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:bookmark) { create(:bookmark) }
  let(:second_bookmark) { build(:bookmark, user: bookmark.user, post: bookmark.post) }

  describe "#user" do
    it 'should have a user' do
      expect(bookmark.user).not_to be_nil
      expect(bookmark.user.class).to be User
    end
  end

  describe "#post" do
    it 'should have a post' do
      expect(bookmark.post).not_to be_nil
      expect(bookmark.post.class).to be Post
    end
  end

  describe "#user <-> #post" do
    it 'should be unique everytime' do
      expect(second_bookmark.valid?).to be false
    end
  end
end
