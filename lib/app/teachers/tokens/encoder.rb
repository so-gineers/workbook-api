# frozen_string_literal: true

module APP
  module Teachers
    module Tokens
      # Encodes a jwt token for given teacher
      class Encoder < JwtTokens::Encoder
        attr_reader :teacher

        # @param teacher [Db::Teacher]
        def initialize(teacher:)
          @teacher = teacher
        end

        def data
          {
            aud: JwtTokens::AUDIENCE,
            exp: 99.days.from_now.to_i,
            iat: Time.now.to_i,
            id: teacher.id,
            iss: JwtTokens::ISSUER
          }
        end
      end
    end
  end
end
