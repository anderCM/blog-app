describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'Should return successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
