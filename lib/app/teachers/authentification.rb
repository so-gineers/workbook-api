# frozen_string_literal: true

module APP
  module Teachers
    # Handles authentication for teachers
    class Authentification < AuthentificationAbstraite
      # @param attributes [Hash]
      # @param repository [Db::Teacher]
      def initialize(attributes = {}, repository: Db::Teacher)
        super(attributes)
        @repository = repository
      end

      # Authenticates the teacher using a session object.
      # @param [SessionAbstraite]
      # @return [Result::Success]
      # @raise [
      #    APP::Exceptions::SessionInvalide,
      #    APP::Exceptions::InvalidCredentials,
      #    APP::Exceptions::TeacherAccountLocked,
      #    APP::Exceptions::TeacherAccountPending,
      #    ]
      def authenticate(session:)
        raise(Exceptions::InvalidSession) unless session.acceptable?

        teacher = repository.find_by(identifier: session.identifier)

        raise Exceptions::InvalidCredentials unless teacher
        raise Exceptions::TeacherAccountLocked if teacher.status.eql?('locked')
        raise Exceptions::TeacherAccountPending if teacher.status.eql?('pending')

        return Results::Success.new(data: teacher) if teacher.authenticate(session.password)

        raise Exceptions::InvalidCredentials
      end

      # @param token [String]
      # @param jwt_decoder [string]
      # @raise [APP::Exceptions::TokenVide]
      def authenticate_with_token(token:, jwt_decoder:)
        data, =
          jwt_decoder.decoder(
            token_jwt: token,
            secret_key: Rails.application.credentials.jwt_students_secret
          )

        raise(Exceptions::TokenVide) if data.nil? || data.empty? || data.empty?

        repository.find(data['id'])
      end
    end
  end
end
