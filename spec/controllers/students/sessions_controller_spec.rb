# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe Students::SessionsController do
#   describe '#create' do
#     let(:params) { { identifier: identifier, password: password } }

#     before { post :create, params: params }
#     context 'with empty params' do
#       let(:identifier) {}
#       let(:password) {}

#       it 'responds with unprocessable entity' do
#         expect(response).to have_http_status(:unprocessable_entity)
#       end
#     end

#     describe 'login exists and password is correct' do
#       let(:student) { FactoryBot.create(:db_student) }
#       let(:identifier) { student.login }
#       let(:password) { 'workbook' }
#       let(:json_response) { JSON.parse(response.body).with_indifferent_access }

#       it 'will respond with a json object' do
#         expect(json_response).to be_a(Hash)
#         expect(json_response[:token]).to eq('')
#       end

#       it 'will render success' do
#         expect(response).to have_http_status(:success)
#       end
#     end
#   end
# end
