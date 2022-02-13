# frozen_string_literal: true

module Teachers
  # Base class for all teacher related controllers
  class TeachersBaseController < ::ApplicationController
    unless Rails.env.production?
      include GlobalRequestLogging
    end

    attr_reader :current_teacher

    before_action :authenticate_teacher

    rescue_from(JWT::DecodeError, with: :not_authorized)

    # Auth Service dependency
    def auth_service
      ::APP::Teachers::Authentification.new
    end

    private

    def authenticate_teacher
      @current_teacher = auth_service.authenticate_with_token(
        token: crypted_token,
        jwt_decoder: ::APP::Teachers::Tokens::Decoder.new
      )
    end

    def not_authorized
      render(
        json: { message: 'Accès non autorisé' },
        status: :unauthorized
      )
    end

    def crypted_token
      request.headers['HTTP_X_WORKBOOK_TOKEN']
      token = request.headers['X-WORKBOOK-TOKEN']
      token ? token.split.last : ''
    end
  end
end
