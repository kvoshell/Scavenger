class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable

  has_many :topics
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy

  attr_accessor :login

  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username
  validates_confirmation_of :password

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_hash).first
      end
  end

  def liked(bookmark)
    likes.where(bookmark_id: bookmark).first
  end
end
