require 'rails_helper'
describe PostsController, type: :controller do
  render_views

  describe 'GET #index' do
    let(:user) { FactoryBot.create(:user) }

    before do
      get :index, params: { user_id: user.id }
    end

    it 'Should return successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'Should render the index template' do
      expect(response).to render_template(:index)
    end

    it 'Should include Default text on template' do
      expect(response.body).to include('List of posts here')
    end
  end

  describe 'GET #show' do
    let(:post) { FactoryBot.create(:post) }
    let(:user) { post.author }
    before do
      get :show, params: { user_id: user.id, id: post.id }
    end
    it 'Should return successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'Should render the index template' do
      expect(response).to render_template(:show)
    end

    it 'Should include Default text on template' do
      expect(response.body).to include('Post Details')
    end
  end
end
