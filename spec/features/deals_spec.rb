require 'rails _helper'

RSpec.describe do

  describe 'GET /deals' do
    let!(:deal) { create(:deal) }
    login_admin

    it 'returns status 200' do
      get :index
      # expect(response).to have_http_status(200)
      expect(response.body).to have_content('Войти в кабинет')
    end

    it 'contains a valid deal' do
      get :index
      expect(response.body).to have_content('New deals')
    end
  end
end
