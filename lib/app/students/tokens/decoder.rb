# frozen_string_literal: true

module APP
  module Students
    module Tokens
      # Decode un token jwt
      class Decoder
        # Decode le token JWT
        # @raise []
        # @return [Array]
        # @param token [String]
        def decoder(token:)
          ::JWT.decode(token, secret, true, options)
        end

        private

        def secret
          Rails.application.credentials.jwt_students_secret
        end

        def options
          {
            algorithm: JwtTokens::HASHING_ALGORITHM,
            aud: JwtTokens::AUDIENCE,
            iss: JwtTokens::ISSUER,
            verify_aud: true,
            verify_iat: true,
            verify_iss: true
          }
        end
      end
    end
  end
end
