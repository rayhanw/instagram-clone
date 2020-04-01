require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { create(:like) }
  let(:second_like) { build(:like, user: like.user, post: like.post) }

  describe "#user with #post" do
    it 'should have a user' do
      expect(like.user).not_to be_nil
    end

    it 'should have a post' do
      expect(like.post).not_to be_nil
    end

    it 'should not save when a user has already liked this post' do
      expect(second_like.valid?).to be false
    end
  end
end
