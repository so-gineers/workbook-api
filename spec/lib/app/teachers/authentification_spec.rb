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
      APP::Teachers::Session.new(identifier: identifier, password: password)
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
        let(:teacher) { FactoryBot.create(:db_teacher, :with_status_active) }
        let(:identifier) { teacher.email }

        context 'when password is invalid' do
          let(:password) { 'iu§!èyoçèà' }

          it 'raises an exception' do
            expect { result }.to raise_error(
              APP::Exceptions::InvalidCredentials
            )
          end
        end

        context 'when password is valid' do
          let(:password) { teacher.password }

          describe 'account is locked' do
            let(:teacher) do
              FactoryBot.create(:db_teacher, :with_status_locked)
            end

            it do
              expect { result }.to raise_error(
                APP::Exceptions::TeacherAccountLocked
              )
            end
          end

          describe 'account is active' do
            let(:teacher) do
              FactoryBot.create(:db_teacher, :with_status_active)
            end
            it 'returns a success results' do
              expect(result).to be_a(APP::Results::Success)
            end

            it 'returns teacher model' do
              expect(result.data).to be_a(Db::Teacher)
            end
          end
        end
      end

      context 'when teacher does not exist' do
        let(:password) { 'unmotdepasse' }
        let(:identifier) { 'une@adresse.identifier' }
        let(:error) { APP::Exceptions::InvalidCredentials }

        it 'raise an exception if credentials are invalid' do
          expect { instance.authenticate(session: session) }.to(
            raise_error(error)
          )
        end
      end
    end
  end
end
