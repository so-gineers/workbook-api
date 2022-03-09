# Manages jwt tokens encoding & decoding
module JwtTokens
  HASHING_ALGORITHM = 'HS512'
  ISSUER = 'wbk/api/ruby-test'
  AUDIENCE = 'wbk/client/mobile-test'

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
