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
        raise(Exceptions::SessionInvalide) unless session.acceptable?

        teacher = repository.find_by(email: session.identifier)

        raise(Exceptions::InvalidCredentials, session) unless teacher
        if teacher.status.eql?('locked')
          raise(Exceptions::TeacherAccountLocked, session)
        end
        if teacher.status.eql?('pending')
          raise(Exceptions::TeacherAccountPending, session)
        end

        if teacher.authenticate(session.password)
          return Results::Success.new(data: teacher)
        end

        raise(Exceptions::InvalidCredentials, session)
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
