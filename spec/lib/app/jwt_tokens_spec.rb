# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tokens' do
  let(:decodeur) { ::JwtTokens::Decoder.new }
  let(:encoder) { ::JwtTokens::Encoder.new }

  describe 'decode' do
    pending
  end

  describe 'encode' do
    describe '#encode' do
      let(:secret_key) { 'secret' }
      let(:operation) { encoder.encoder(secret_key: secret_key) }
      let(:error) { ::APP::Exceptions::EmptyToken }

      it 'fait appel à la gem JWT' do
        encoder.data = { id: 'pathe' }
        expect(JWT).to receive(:encode).with(anything, secret_key, anything)

        operation
      end

      it 'lève une exception si les données ne sont pas un hash' do
        expect { operation }.to raise_error(error)
      end

      it 'lève une exception si les données sont un hash vide' do
        encoder.data = {}
        expect { operation }.to raise_error(error)
      end
    end
  end
end
