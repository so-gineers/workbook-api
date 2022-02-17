# frozen_string_literal: true

require 'rails_helper'


BadLoginParams = Struct.new(:identifier, :password, :expected_status_code)
BAD_LOGIN_TABLES = [
  BadLoginParams.new('',  '', :precondition_failed),
  BadLoginParams.new('badidentifier.com', '', :precondition_failed),
  BadLoginParams.new(FactoryBot.create(:db_teacher, :with_status_active).email, 'bad_password', :precondition_failed)
]

RSpec.describe Teachers::SessionsController do
  describe '#create' do
    let(:params) { { identifier: identifier, password: password } }
    before { post :create, params: params }

    BAD_LOGIN_TABLES.each do |table_test|
      context "bad empty params #{table_test.inspect}" do
        let(:identifier) { table_test.identifier }
        let(:password) { table_test.password }

        it 'responds with unprocessable entity' do
          expect(response).to have_http_status(table_test.expected_status_code)
        end
      end
    end

    context 'with email address and valid password ' do
      let(:teacher) { FactoryBot.create(:db_teacher, :with_status_active) }
      let(:identifier) { teacher.email }
      let(:password) { teacher.password }
      let(:parsed_body) { JSON.parse(response.body).with_indifferent_access }

      it { expect(response).to have_http_status(:created) }
      it 'will return a json encoded response' do
        expect(parsed_body[:token]).not_to be_nil
      end
    end
  end
end
