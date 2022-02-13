require 'rails_helper'

RSpec.describe 'Routes for Teachers::Sessions' do
    describe 'routes POST /teachers/sessions' do
      it do
        expect(post: '/teachers/sessions').to route_to(
          controller: 'teachers/sessions', action: 'create'
        )
      end
    end
end