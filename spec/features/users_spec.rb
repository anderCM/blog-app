require 'rails_helper'
RSpec.describe 'Users' do
  describe 'User #index' do
    it 'Should render Anderson and Sophie in the index page' do
      visit users_path
      expect(page).to have_content('Anderson')
      expect(page).to have_content('Anderson 2')
      expect(page).to have_content('Anderson 3')
      expect(page).to have_content('Anderson 4')
    end
  end
end
