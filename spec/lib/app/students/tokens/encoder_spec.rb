# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe APP::Students::Tokens::Encoder do
#   let(:instance) { described_class.new(student: student) }
#   let(:student) { FactoryBot.create(:db_student) }
#   let(:secret_key) { Rails.application.credentials.jwt_students_secret }

#   describe '#initialize' do
#     it 'keeps a reference to the student' do
#       expect(instance.student).to eq(student)
#     end
#   end

#   describe '#payload' do
#     it 'contains json data' do
#       payload = instance.payload

#       expect(payload[:id]).to eq(student.id)
#       expect(payload[:iss]).to eq('wbk/api/ruby-test')
#       expect(payload[:aud]).to eq('wbk/client/mobile-test')
#       expect(payload[:exp]).to be_a(Integer)
#       expect(payload[:iat]).to be_a(Integer)
#     end
#   end

#   describe '#encode!' do
#     it 'uses jwt library to encode token' do
#       expect(JWT).to receive(:encode).with(
#         instance.payload,
#         secret_key,
#         APP::Students::Tokens::ALGORITHM
#       )

#       instance.encode!
#     end
#   end
# end
