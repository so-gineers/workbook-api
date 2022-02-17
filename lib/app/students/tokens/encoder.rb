# frozen_string_literal: true

module APP
  module Students
    module Tokens
      # Creates  signed JWT a student can reuse to authenticate with our APIS
      class Encoder
        attr_reader :student

        # @param student [Db::Student]
        def initialize(student:)
          @student = student
        end

        def encode!
          JWT.encode(
            payload,
            Rails.application.credentials.jwt_students_secret,
            JwtTokens::HASHING_ALGORITHM
          )
        end

        def payload
          {
            aud: JwtTokens::AUDIENCE,
            exp: 99.days.from_now.to_i,
            iat: Time.now.to_i,
            id: student.id,
            iss: JwtTokens::ISSUER
          }
        end
      end
    end
  end
end
