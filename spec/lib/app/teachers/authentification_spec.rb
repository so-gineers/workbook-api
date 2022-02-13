# frozen_string_literal: true

require 'rails_helper'

RSpec.describe APP::Teachers::Authentification do
  let(:instance) { described_class.new }
  let(:result) { instance.authenticate(session: session) }

  describe '#authenticate_par_jeton' do
    pending
  end

  describe '#authenticate' do
    let(:session) do
      APP::Teachers::Session.new(
        identifier: identifier,
        password: password
      )
    end

    context 'with an invalid session' do
      let(:password) {}
      let(:identifier) {}

      it 'raises an exception' do
        expect { result }.to raise_error(::APP::Exceptions::SessionInvalide)
      end
    end

    context 'with a valid session' do
      context 'with existing teacher' do
        let(:teacher) { FactoryBot.create(:db_teacher) }
        let(:identifier) { teacher.email }

        context 'when password is invalid' do
          let(:password) { 'iu§!èyoçèà' }

          it 'raises an exception' do
            expect { result }.to raise_error(APP::Exceptions::InvalidCredentials)
          end
        end

        context 'when password is valid' do
          let(:password) { teacher.password }

          it "retourne l'utilisateur en question" do
            expect(result).to be_a(APP::Results::Success)
            expect(result.data).to respond_to(:token)
          end
        end
      end

      context 'when teacher does not exist' do
        let(:password) { 'unmotdepasse' }
        let(:identifier) { 'une@adresse.identifier' }

        it 'raise an exception if credentials are invalid' do
          expect { instance.authenticate(session: session) }.to(
            raise_error(APP::Exceptions::InvalidCredentials)
          )
        end
      end
    end
  end
end
