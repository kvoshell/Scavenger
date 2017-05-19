require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  let(:topic) { Topic.create!(id: 1, title: "title") }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, id: topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders the show view" do
      get :show, id: topic.id
      expect(assigns(:topic)).to eq(topic)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "initializes @topic" do
      get :new
      expect(assigns(:topic)).not_to be_nil
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, id: topic.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    it "increases the number of topics by 1" do
      expect {post :create, topic: {id: 1, title: "title"}}.to change(Topic,:count).by(1)
    end

    it "assigns Topic.last to @topic" do
      post :create, topic: {id: 1, title: "title"}
      expect(assigns(:topic)).to eq Topic.last
    end
  end

end
