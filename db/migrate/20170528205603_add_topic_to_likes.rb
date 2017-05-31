class AddTopicToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :topic, index: true, foreign_key: true
  end
end
