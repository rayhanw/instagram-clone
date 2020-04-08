class User < ApplicationRecord
  include AlgoliaSearch
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login]

  attr_writer :login

  algoliasearch do
    attribute :username, :name
    add_attribute :avatar_url
  end

  def login
    @login || username || email
  end

  def not_conversed_with
    ids = direct_messages.pluck(:receiver_id, :sender_id).flatten.uniq

    User.where.not(id: ids)
  end

  has_one_attached :avatar
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  def avatar_url
    if avatar.attached?
      Cloudinary::Utils.cloudinary_url avatar&.key, crop: :fill, gravity: :face
    else
      ActionController::Base.helpers.asset_path 'avatar.png'
    end
  end

  def direct_messages
    @direct_messages ||= DirectMessage.where('sender_id = :id OR receiver_id = :id', id: id)
  end

  def messages
    @messages ||= Message.where(direct_message: direct_messages)
  end

  has_many :messages, through: :direct_messages

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 6 }
  validates :name, presence: true

  class << self
    def find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", value: login.downcase]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end
  end
end
