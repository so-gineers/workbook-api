# frozen_string_literal: true

module APP
  # Manages jwt tokens encoding & decoding
  module JwtTokens
    HASHING_ALGORITHM = 'HS512'
    ISSUER = 'wbk/api/ruby-test'
    AUDIENCE = 'wbk/client/mobile-test'

    # Base class for encoding jwt in the platform.
    # Application services must subclass this object if they want to encode
    # date in Json Web Tokens.
    class Encoder
      attr_accessor :data

      # Encode the payload that was set in APP::JwtTokens::Encoder#data
      # @param secret_key [String] a very secret key used to encode
      def encoder(secret_key:)
        raise ::APP::Exceptions::TokenVide unless invalid_data?

        JWT.encode(data, secret_key, HASHING_ALGORITHM)
      end

      private

      def invalid_data?
        data.is_a?(Hash) && !data.empty?
      end
    end

    # Base class for decoding jwt token in the platform.
    # Application services must subclass this object if they want to decode
    # date in Json Web Tokens.
    class Decoder
      def decoder(token_jwt:, secret_key:)
        data, _algorithm =
          JWT.decode(token_jwt, secret_key, true, decoding_options)
        data
      end

      def decoding_options
        raise NotImplementedError
      end
    end
  end
end
