class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user

  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 1}, presence: true
  validates :url, presence: true
  validates :topic, presence: true

end
