class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  default_scope { order('created_at DESC') }

  validates :title, length: {minimum: 1}, presence: true

end
