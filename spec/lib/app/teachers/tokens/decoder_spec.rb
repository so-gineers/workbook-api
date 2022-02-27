# frozen_string_literal: true

require 'rails_helper'

RSpec.describe APP::Teachers::Tokens::Decoder do
  let(:instance) { described_class.new }

  it 'hérite de la class encodeur de base' do
    expect(instance).to be_a(APP::JwtTokens::Decoder)
  end

  it 'définit une méthode options de décodage' do
    expect(instance.decoding_options).to be_a(Hash)
  end
end
