# frozen_string_literal: true

require 'rails_helper'
require 'support/controller_macros'

RSpec.describe 'Deals', type: :request do
  describe 'GET /deals' do
    let!(:deal) { create(:deal) }
    # login_admin

    it 'returns status 200' do
      admin = login :admin
      admin.get '/deals'
      admin.response.code.should eq '200'

      # expect(response).to have_http_status(200)
      # expect(response.body).to have_content('Войти в кабинет')
    end

    it 'contains a valid deal' do
      get :index
      expect(response.body).to have_content('New deals')
    end
  end
end
