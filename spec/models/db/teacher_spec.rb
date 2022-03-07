require 'rails_helper'

REQUIRED_COLUMS = %w(identifier email first_name last_name phone_number).freeze 
ENCRYPTED_COLUMS = %w(email first_name last_name phone_number).freeze 

describe Db::Teacher do
  it { is_expected.to have_secure_password }

  REQUIRED_COLUMS.each { |c| 
    it { is_expected.to validate_presence_of(c) } 
  }

  ENCRYPTED_COLUMS.each do |c| 
    context "column #{c} is private data and is encrypted" do
    subject { described_class.encrypted_attributes }
    it { is_expected.to include(c.to_sym) } 
    end
  end

  context 'unique columns' do
    before { FactoryBot.create(:db_teacher) }

    it { is_expected.to validate_uniqueness_of(:identifier).case_insensitive }
  end
end
