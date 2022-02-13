# frozen_string_literal: true

require 'rails_helper'

RSpec.describe APP::Teachers::Tokens::Encoder do
  let(:teacher) { OpenStruct.new(id: 'a-u-u-i-d') }
  let(:instance) { described_class.new(teacher: teacher) }

  describe '#data' do
    subject { instance.data }

    it { is_expected.to be_a(Hash) }
    it { is_expected.to have_key(:aud) }
    it { is_expected.to have_key(:iat) }
    it { is_expected.to have_key(:iat) }
    it { is_expected.to have_key(:exp) }

    it { expect(subject[:id]).to eq(teacher.id) }
  end
end
