require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  let(:topic) { Topic.create!(id: 1, title: "title") }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: topic.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: topic.id
      expect(response).to have_http_status(:success)
    end
  end

end
