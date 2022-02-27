# frozen_string_literal: true

module APP
  module Teachers
    module Tokens
      # Decodes a jwt that was previously generated for a teacher
      class Decoder < JwtTokens::Decoder
        def decoding_options
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
