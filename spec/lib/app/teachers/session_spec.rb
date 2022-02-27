# frozen_string_literal: true

require 'rails_helper'

RSpec.describe APP::Teachers::Session do
  it { is_expected.to respond_to(:identifier) }
  it { is_expected.to respond_to(:password) }

  describe '#acceptable' do
    TeacherSessionTestTables::TABLES.each do |table_test|
      context "avec #{table_test.session&.identifier}, `#{table_test.session.password}`" do
        let(:instance) do
          described_class.new(
            identifier: table_test.session.identifier,
            password: table_test.session.password
          )
        end

        it " returns #{table_test.expected_result}" do
          expect(instance.acceptable?).to eq(table_test.expected_result)
        end
      end
    end
  end
end
