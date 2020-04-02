# frozen_string_literal: true

def retrieve_file(filename)
  Rails.root.join('spec', 'fixtures', 'files', filename)
end

def create_file_blob(filename: "racecar.jpg", content_type: "image/jpeg", metadata: nil)
  ActiveStorage::Blob.create_after_upload! io: retrieve_file(filename).open, filename: filename, content_type: content_type, metadata: metadata
end

FactoryBot.define do
  factory(:post) do
    user { create(:user) }

    after(:build) do |post|
      post.photos.attach(create_file_blob)
    end
  end
end
