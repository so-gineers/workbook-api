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
      # @raise [APP::Exceptions::SessionInvalide,
      #    APP::Exceptions::InvalidCredentials]
      def authenticate(session:)
        raise(Exceptions::SessionInvalide) unless session.acceptable?

        teacher = repository.find_by(email: session.identifier)

        raise(Exceptions::InvalidCredentials, session) unless teacher

        return succes_response(teacher) if teacher.authenticate(session.password)

        raise(Exceptions::InvalidCredentials, session)
      end

      # @param token [String]
      # @param jwt_decoder [string]
      # @raise [APP::Exceptions::TokenVide]
      def authenticate_with_token(token:, jwt_decoder:)
        data, = jwt_decoder.decoder(
          token_jwt: token,
          secret_key: Rails.application.credentials.jwt_students_secret
        )

        raise(Exceptions::TokenVide) if data.nil? || data.empty? || data.empty?

        repository.find(data['id'])
      end

      private

      def succes_response(teacher)
        Results::Success.new(
          data: OpenStruct.new(token: token(teacher),
                               display_name: [teacher.person_title, teacher.last_name.upcase].join)
        )
      end

      def token(teacher)
        encodeur_jwt(teacher)
          .encoder(secret_key: Rails.application.credentials.jwt_students_secret)
      end

      def encodeur_jwt(teacher)
        Tokens::Encoder.new(teacher: teacher)
      end
    end
  end
end
