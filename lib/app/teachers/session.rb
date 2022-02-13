# frozen_string_literal: true

module APP
  module Teachers
    # Encapsulates the business logic to validate the identifiers entered when
    # connecting a teacher.
    class Session
      include ActiveModel::Model
      include ActiveModel::Validations

      attr_accessor :identifier, :password

      validates :identifier, presence: true, length: { minimum: 6, maximum: 255 }
      validates :password, presence: true, length: { minimum: 6, maximum: 255 }

      # Check that this session is valid and avoid touching the database for:
      # * malformatted email addresses
      # * passwords below the minimum last number of characters
      # * any string that exceeds 255 characters
      def acceptable?
        all_valid = valid?

        record_session_failure! unless all_valid

        all_valid
      end

      private

      def record_session_failure!; end
    end
  end
end
