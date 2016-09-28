require 'rails_helper'

RSpec.describe ArticlesController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/articles', format: 'json').to route_to(controller: 'articles', action: 'index', format: 'json')
    end

    it 'routes to #create' do
      expect(post: '/articles', format: 'json').to route_to(controller: 'articles', action: 'create', format: 'json')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/articles/1', format: 'json').to route_to(controller: 'articles', action: 'update', format: 'json', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/articles/1', format: 'json').to route_to(controller: 'articles', action: 'destroy', format: 'json', id: '1')
    end

  end
end
