#require 'rails_helper'
#describe UsersController, type: :request do
#  #render_views
#  describe 'GET #index' do
#    before do
#      #get :index
#      get '/users'
#    end
#    it 'Should return successful response' do
#      expect(response).to have_http_status(:success)
#    end
#
#    it 'Should render the index template' do
#      expect(response).to render_template(:index)
#    end
#
#    it 'Should include Default text on template' do
#      expect(response.body).to include('List of users here')
#    end
#  end
#
#  describe 'GET #show' do
#    let(:user) { FactoryBot.create(:user) }
#
#    before do
#      #get :show, params: { id: user.id }
#      get "/users/#{user.id}"
#    end
#
#    it 'Should return successful response' do
#      expect(response).to have_http_status(:success)
#    end
#
#    it 'Should render the show template' do
#      expect(response).to render_template(:show)
#    end
#
#    it 'Should include Default text on template' do
#      expect(response.body).to include('User Details')
#    end
#  end
#end
