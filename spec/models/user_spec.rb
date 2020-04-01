# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:second_user) { build(:user, username: user.username) }

  describe "#username" do
    it 'should have a username' do
      expect(user.username).not_to be_empty
    end

    it 'should have a unique username' do
      expect(second_user.valid?).to be false
    end

    it 'should be at least 6 characters' do
      expect(user.username.size).to be >= 6
    end

    it 'should only contain numbers and letters' do
      expect(user.username).to match /[A-Za-z0-9]{6,}/
    end
  end
end
