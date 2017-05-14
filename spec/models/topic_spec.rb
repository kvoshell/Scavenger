require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:topic) { Topic.create!(title: 'New Topic title', id: 1) }

  it { is_expected.to have_many(:bookmarks) }
  it { is_expected.to belong_to(:user) }
  it { validate_length_of(topic).is_at_least(1) }

  describe "attributes" do
    it "has a title and id" do
      expect(topic).to have_attributes(title: topic.title, id: 1)
    end
  end
end
