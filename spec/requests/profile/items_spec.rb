# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Profile::Items', type: :request do
  describe 'GET /profile/items' do
    it 'works! (now write some real specs)' do
      get profile_items_path
      expect(response).to have_http_status(200)
    end
  end
end
