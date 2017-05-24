require 'rails_helper'

RSpec.describe User, type: :model do

  let (:user) { User.create!(id: 1, email: "test@test.com", password: "password", username: "Kevin") }

  it { is_expected.to have_many(:topics) }
  it { is_expected.to have_many(:likes) }
  
  it { is_expected.to validate_presence_of(:username) }
  it { should validate_confirmation_of(:password) }

  describe "attributes" do
    it "should have id, email, and name attributes" do
      expect(user).to have_attributes(id: 1, email: "test@test.com", username: "Kevin")
    end
  end


end
