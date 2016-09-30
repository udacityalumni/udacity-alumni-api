require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: 'api/v1/articles', format: 'json').to route_to(controller: 'api/v1/articles', action: 'index', format: :json)
    end

    it 'routes to #create' do
      expect(post: 'api/v1/articles', format: 'json').to route_to(controller: 'api/v1/articles', action: 'create', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'api/v1/articles/1', format: 'json').to route_to(controller: 'api/v1/articles', action: 'update', format: :json, id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'api/v1/articles/1', format: 'json').to route_to(controller: 'api/v1/articles', action: 'destroy', format: :json, id: '1')
    end

  end
end
