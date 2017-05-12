class RemoveUserColumn < ActiveRecord::Migration
  def change
    remove_column :users, :title
    add_column :bookmarks, :title, :string
  end
end
