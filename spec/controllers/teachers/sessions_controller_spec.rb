# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Teachers::SessionsController do
  describe '#create' do
    before { post :create, params: params }

    let(:params) { { identifier: identifier, password: password } }

    context 'with empty params' do
      let(:identifier) {}
      let(:password) {}

      it 'responds with unprocessable entity' do
        expect(response).to have_http_status(:precondition_failed)
      end
    end

    context 'with invalid email address format' do
      let(:identifier) { 'badidentifier.com' }
      let(:password) {}

      it 'responds with precondition failed' do
        expect(response).to have_http_status(:precondition_failed)
      end
    end

    context 'with valid email address format and bad password' do
      let(:identifier) { 'bad@identifier.com' }
      let(:password) { 'badpassword' }

      it 'responds with precondition failed' do
        expect(response).to have_http_status(:precondition_failed)
      end
    end

    context 'with email address and valid password ' do
      let(:teacher) { FactoryBot.create(:db_teacher) }
      let(:identifier) { teacher.email }
      let(:password) { teacher.password }

      it { expect(response).to have_http_status(:created) }

      it 'will return a json encoded response' do
        json = JSON.parse(response.body).with_indifferent_access
        expect(json[:token]).not_to be_nil
      end
    end
  end
end
