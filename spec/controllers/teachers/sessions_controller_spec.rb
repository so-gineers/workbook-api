# frozen_string_literal: true

require 'rails_helper'

BadLoginParams =
  Struct.new(:test_description, :identifier, :password, :expected_status_code)
BAD_LOGIN_TABLES = [
  BadLoginParams.new(
    'no identifier and empty password',
    nil,
    '',
    :precondition_failed
  ),
  BadLoginParams.new(
    'empty identifier and no password',
    '',
    nil,
    :precondition_failed
  ),
  BadLoginParams.new('empty identifier and password', '', '', :precondition_failed),
  BadLoginParams.new(
    'unknown identifier address and empty password',
    'badidentifier.com',
    '',
    :precondition_failed
  ),
  BadLoginParams.new(
    'known identifier and bad password',
    FactoryBot.create(:db_teacher, :with_status_active).identifier,
    'bad_password',
    :precondition_failed
  )
].freeze

RSpec.describe Teachers::SessionsController do
  describe '#create' do
    let(:params) { { identifier: identifier, password: password } }
    before { post :create, params: params }

    BAD_LOGIN_TABLES.each do |table_test|
      context table_test.test_description do
        let(:identifier) { table_test.identifier }
        let(:password) { table_test.password }

        it 'responds with unprocessable entity' do
          expect(response).to have_http_status(table_test.expected_status_code)
        end
      end
    end

    context 'with identifier address and valid password ' do
      let(:teacher) { FactoryBot.create(:db_teacher, :with_status_active) }
      let(:identifier) { teacher.identifier }
      let(:password) { teacher.password }
      let(:display_name) { "Mr #{teacher.last_name}" }
      let(:parsed_body) { JSON.parse(response.body).with_indifferent_access }

      it { expect(response).to have_http_status(:created) }

      it 'will return a json encoded response' do
        expect(parsed_body[:token]).not_to be_nil
        expect(parsed_body[:display_name]).to eq(display_name)
      end
    end
  end
end
