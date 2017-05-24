require 'rails_helper'

RSpec.describe Bookmark, type: :model do

  let (:bookmark) { Bookmark.create!(id: 1, url: "www.test.com", topic_id: topic.id, title: "test title") }
  let (:topic) { Topic.create!(title: 'New Topic title', id: 1) }

  it { is_expected.to belong_to(:topic) }
  it { is_expected.to have_many(:likes) }

  describe "attributes" do
    it "has id, url, topic_id, title" do
      expect(bookmark).to have_attributes(id: 1, url: "www.test.com", topic_id: topic.id, title: "test title")
    end

    it "is connected to a specific Topic" do
      expect(bookmark.topic_id).to eq(topic.id)
    end
  end
end
