require 'rails_helper'
describe UsersController, type: :controller do
  describe 'GET #index' do
    render_views
    before do
      get :index
    end
    it 'Should return successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'Should render the index  template' do
      expect(response).to render_template(:index)
    end

    it 'Should include Default text on template' do
      expect(response.body).to include('List of users here')
    end
  end
end
