require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do

  let(:topic) { Topic.create!(title: "Topic Title", user_id: 1) }
  let(:bookmark) { Bookmark.create!(title: "New Title", url: "http://www.hipster.com", topic_id: topic.id) }


  describe "GET new" do
      it "returns http success" do
        get :new, topic_id: topic.id
        expect(response).to have_http_status(:success)
      end

      it "renders the new view" do
        get :new, topic_id: topic.id
        expect(response).to render_template :new
      end
    end

    describe "POST create" do
      it "increases the number of Bookmark by 1" do
        expect {post :create, topic_id: topic.id, bookmark: {title: "New Title", url: "http://www.hipster.com", topic_id: topic.id }}.to change(Bookmark,:count).by(1)
      end

      it "assigns the new bookmark to @bookmark" do
        post :create, topic_id: topic.id, bookmark: {title: "New Title", url: "http://www.hipster.com", topic_id: topic.id}
        expect(assigns(:bookmark)).to eq Bookmark.last
      end
    end

  describe "GET edit" do
    it "returns http success" do
      get :edit, topic_id: topic.id, id: bookmark.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE destroy" do
    it "deletes the bookmark" do
      delete :destroy, topic_id: topic.id, id: bookmark.id
      count = Bookmark.where({id: bookmark.id}).size
      expect(count).to eq 0
    end
  end
end
