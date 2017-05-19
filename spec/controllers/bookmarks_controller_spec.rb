require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do

  let(:topic) { Topic.create!(title: "Topic Title", user_id: 1) }
  let(:bookmark) { Bookmark.create!(title: "New Title", url: "http://www.hipster.com", topic_id: topic.id) }


  describe "GET new" do
      #   it "returns http success" do
      #     get :new, topic_id: topic.id
      #     expect(response).to have_http_status(:success)
      #   end
      #
      #   it "renders the #new view" do
      #     get :new, topic_id: topic.id
      #     expect(response).to render_template :new
      #   end
      #
      #   it "instantiates @bookmark" do
      #     get :new, topic_id: topic.id
      #     expect(assigns(:bookmark)).not_to be_nil
      #   end
      end

      describe "POST create" do
        it "increases the number of Bookmark by 1" do
          expect {post :create, bookmark: {title: "New Title", url: "http://www.hipster.com", topic_id: topic.id }}.to change(Bookmark,:count).by(1)
        end

        it "assigns the new bookmark to @bookmark" do
          post :create, bookmark: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
          expect(assigns(:bookmark)).to eq bookmark.last
        end

        it "redirects to the new bookmark" do
          post :create, bookmark: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
          expect(response).to redirect_to bookmark.last
        end
      end
  #
  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
