require 'rails_helper'

RSpec.describe 'Routes for home page' do
  describe 'routes GET /' do
    it do
      expect(get: '/').to route_to(
        controller: 'home',
        action: 'index'
      )
    end
  end
end
