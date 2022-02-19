# frozen_string_literal: true

require 'rails_helper'

RSpec.describe APP::JsonFormatters::TeacherSession do
  describe '#render' do
    let(:teacher) { OpenStruct.new(params) }
    let(:rendered) { described_class.render(teacher) }
    let(:params) { { last_name: 'SENE', id: 'a-uuid' } }
    let(:parsed_data) { JSON.parse(rendered).with_indifferent_access }
    let(:expected_jwt_token) { 'just.testing.jwt' }

    before do
      allow_any_instance_of(APP::Teachers::Tokens::Encoder).to receive(
        :encoder
      ) { expected_jwt_token }
    end

    it 'returns teacher id' do
      expect(parsed_data[:id]).to eq(('a-uuid'))
    end

    it 'returns teacher display name' do
      expect(parsed_data[:display_name]).to eq('Mr SENE')
    end

    it 'returns expected jwt token' do
      expect(parsed_data[:token]).to eq(expected_jwt_token)
    end
  end
end
