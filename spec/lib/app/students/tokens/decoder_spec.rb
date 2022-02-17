# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe APP::Students::Tokens::Decoder do
#   let(:instance) { described_class.new }
#   let(:pathe) { FactoryBot.create(:db_student) }
#   let(:secret_key) { Rails.application.credentials.jwt_students_secret }
#   let(:algorithm) { APP::JwtTokens::HASHING_ALGORITHM }
#   let(:aud) { APP::JwtTokens::AUDIENCE }
#   let(:iss) { APP::JwtTokens::ISSUER }
#   let(:iat) { Time.now.to_i }
#   let(:payload) { { id: 'pathe', iss: iss, aud: aud, iat: iat } }
#   let(:token) { JWT.encode(payload, secret_key, algorithm) }

#   let(:subject) { instance.decoder(token: token) }

#   describe '#decoder' do
#     it 'will call decode on the JWT lib' do
#       expect(JWT).to receive(:decode)
#       subject
#     end

#     it { expect(subject).to be_a(Array) }

#     it 'payload includes student id' do
#       res = subject.first.with_indifferent_access
#       expect(res['id']).to eq('pathe')
#     end

#     describe 'When AUD is invalid' do
#       let(:aud) { 'invalid' }

#       it { expect { subject }.to raise_error(JWT::InvalidAudError) }
#     end

#     describe 'When ISS is invalid' do
#       let(:iss) { 'invalid iss' }

#       it { expect { subject }.to raise_error(JWT::InvalidIssuerError) }
#     end

#     describe 'When IAT is invalid' do
#       let(:iat) { 5.days.from_now.to_i }

#       it { expect { subject }.to raise_error(JWT::InvalidIatError) }
#     end
#   end
# end
