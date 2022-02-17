# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe APP::Students::Auth do
#   it { is_expected.to respond_to(:with_session) }
#   it { is_expected.to respond_to(:with_token) }

#   describe '#with_token' do
#     let(:token_vide) { JWT::DecodeError }
#     let(:decodeur_jwt) { APP::Students::Tokens::Decoder.new }

#     let(:instance) { described_class.new }
#     subject do
#       instance.with_token(token: token)
#     end

#     context 'avec un token nil' do
#       let(:token) {}

#       it 'lève une exception' do
#         expect { subject }.to raise_exception(token_vide)
#       end
#     end

#     context 'avec un token vide' do
#       let(:token) { '' }

#       it 'lève une exception' do
#         expect { subject }.to raise_exception(token_vide)
#       end
#     end

#     context 'avec un token au format incorrect' do
#       let(:token) { 'afaketoken' }

#       it 'lève une exception' do
#         expect { subject }.to raise_error(JWT::DecodeError)
#       end
#     end

#     describe 'avec un token au format correct' do
#       let(:token) do
#         APP::Students::Tokens::Encoder.new(student: student).encode!
#       end

#       context 'avec un élève valide' do
#         let(:student) { FactoryBot.create(:db_student) }

#         it "fait appel au repository pour trouver l'élève" do
#           expect(instance.students_repository).to receive(:find).with(student.id)
#           subject
#         end

#         it 'retourne la même instance' do
#           expect(subject).to eq(student)
#         end
#       end

#       context 'avec un elève invalide' do
#         let(:student) { FactoryBot.build(:db_student) }

#         it 'lève une exception' do
#           expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
#         end
#       end
#     end
#   end

#   describe '#with_session' do
#     context 'sans utilisateurs dans la base données' do
#     end

#     context 'avec des utilisateurs dans la base données' do
#       let!(:student) { FactoryBot.create(:db_student) }
#       subject do
#         described_class.new.with_session(
#           identifier: identifier,
#           password: password
#         )
#       end

#       context 'avec des identifiers valides' do
#         let(:identifier) { student.login }
#         let(:password) { student.password }

#         it 'retourne un élève authentifié' do
#           is_expected.to eq(student)
#         end
#       end

#       context 'avec des identifiers invalides' do
#         let(:exception_indefinis) do
#           APP::Exceptions::IdentifiantsIndefinis
#         end

#         context 'avec un mot de passe nul' do
#           let(:identifier) { SecureRandom.uuid }
#           let(:password) { nil }

#           it 'lève une exception' do
#             expect { subject }.to raise_error(exception_indefinis)
#           end
#         end
#         context 'avec un identifier nul' do
#           let(:identifier) { nil }
#           let(:password) { student.password }

#           it 'lève une exception' do
#             expect { subject }.to raise_error(exception_indefinis)
#           end
#         end

#         context 'avec un identifier vide' do
#           let(:identifier) { '' }
#           let(:password) { student.password }

#           it 'lève une exception' do
#             expect { subject }.to raise_error(exception_indefinis)
#           end
#         end

#         context 'avec un identifier vide' do
#           let(:identifier) { SecureRandom.uuid }
#           let(:password) { '' }

#           it 'lève une exception' do
#             expect { subject }.to raise_error(exception_indefinis)
#           end
#         end

#         context 'avec un identifier inconnu' do
#           let(:identifier) { SecureRandom.uuid }
#           let(:password) { student.password }

#           it 'lève une exception' do
#             expect { subject }.to raise_error(
#               APP::Exceptions::IdentifiantInconnu
#             )
#           end
#         end

#         context 'avec un mot de passe invalide' do
#           let(:identifier) { student.login }
#           let(:password) { 'invalide' }

#           it "retourne l'élève authentifié" do
#             is_expected.to eq(false)
#           end
#         end
#       end
#     end
#   end
# end
