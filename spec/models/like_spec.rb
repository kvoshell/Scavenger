require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { Like.create!(id: 1, bookmark_id: 1, user_id: 1)}

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:bookmark) }
end
