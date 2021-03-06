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
      raise ::APP::Exceptions::EmptyToken unless invalid_data?

      JWT.encode(data, secret_key, HASHING_ALGORITHM)
    end

    private

    def invalid_data?
      data.is_a?(Hash) && !data.empty?
    end
  end
end
