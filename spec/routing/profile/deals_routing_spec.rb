# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile::DealsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/profile/deals').to route_to('profile/deals#index')
    end

    it 'routes to #new' do
      expect(get: '/profile/deals/new').to route_to('profile/deals#new')
    end

    it 'routes to #show' do
      expect(get: '/profile/deals/1').to route_to('profile/deals#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/profile/deals/1/edit').to route_to('profile/deals#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/profile/deals').to route_to('profile/deals#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/profile/deals/1').to route_to('profile/deals#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/profile/deals/1').to route_to('profile/deals#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/profile/deals/1').to route_to('profile/deals#destroy', id: '1')
    end
  end
end
