# frozen_string_literal: true

module APP
  module Students
    # Authentication service for students
    class Auth
      attr_reader :students_repository

      # Initializer
      #
      # @param students_repository [Db::Student] Repository used to search for student
      def initialize(students_repository: ::Db::Student)
        @students_repository = students_repository
      end

      # Authenticates a student with the credentials passed in parameters
      #
      # @param identifier [String]
      # @param password [String]
      def with_session(identifier:, password:)
        raise ::APP::Exceptions::IdentifiantsIndefinis if !identifier.present? || !password.present?

        student = students_repository.find_by(login: identifier)

        raise ::APP::Exceptions::IdentifiantInconnu unless student

        return false unless student.authenticate(password)

        student
      end

      # Authenticatates a student with the token passed in parameters
      #
      # @param token
      # @param jwt_decoder
      #
      # @raise [Exceptions::TokenVide]
      def with_token(token:, jwt_decoder: Tokens::Decoder.new)
        data = jwt_decoder.decoder(token: token)

        raise Exceptions::TokenVide if data.nil? || data.empty?

        students_repository.find(data.first['id'])
      end
    end
  end
end
