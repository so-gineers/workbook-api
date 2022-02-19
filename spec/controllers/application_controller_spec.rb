# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController do
  it 'has a class method to add a service' do
    expect(described_class).to respond_to(:add_service)
  end

  describe 'adding new services' do
    controller { add_service :test_service, TestControllerLevelService }

    it 'know that a service was added' do
      expect(controller).to respond_to(:test_service)
    end

    it 'returns a new instance of the service' do
      expect(controller.test_service).to be_a(TestControllerLevelService)
    end

    it 'can invoke the service' do
      expect(controller.test_service.test_method).to eq('test output')
    end
  end
end
