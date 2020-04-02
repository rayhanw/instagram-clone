# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { build(:post) }

  describe "#photos" do
    it 'should be invalid if it does not have a photo' do
      post.photos = nil
      expect(post.valid?).to be false
    end

    it 'should have at least one photo' do
      post.photos.attach(create_file_blob)
      expect(post.photos.any?).to be true
    end
  end
end
