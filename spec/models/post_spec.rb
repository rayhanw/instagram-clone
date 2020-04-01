# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { build(:post) }

  describe "#description" do
    it 'should have a description' do
      expect(post.description).not_to be_empty
    end
  end
end
