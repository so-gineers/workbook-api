# frozen_string_literal: true

module APP
  # Abstract authentication class
  # This class should not be instantiated.
  class AuthentificationAbstraite
    include ActiveModel::Model

    # The repository where users data is stored
    # Mostly it will be an active record class or
    # a class that has the same interface
    attr_accessor :repository

    # The service that used to decode the jwt tokens
    # Students & teachers have their own jwt decoders
    # @see APP::Students::Tokens::Decoder, APP::Teachers::Tokens::Decoder
    attr_accessor :decodeur_jwt

    # Authenticates a user using a session object that is at most a combination
    # of identifier & password.
    #
    # @param session [SessionAbstraite]
    def authenticate(session:)
      raise NotImplementedError
    end

    # Authenticates a user with a jwt token
    #
    # @param token [String] a jwt token
    def authenticate_with_token(token:)
      raise NotImplementedError
    end
  end
end
