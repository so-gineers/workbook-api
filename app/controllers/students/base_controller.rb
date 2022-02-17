# frozen_string_literal: true

module Students
  # Base class for all students related controllers
  class BaseController < ApplicationController
    include GlobalRequestLogging

    attr_reader :current_student

    before_action :authenticate_student

    rescue_from(::JWT::DecodeError, with: :not_authorized)

    add_service :auth_service, ::APP::Students::Auth

    private

    def authenticate_student
      @current_student = auth_service.with_token(token: crypted_token)
      render(json: { message: 'Utilisateur introuvable' }, status: :unauthorized) and return unless @current_student
    end

    def not_authorized
      render(json: { message: 'Accès non autorisé' }, status: :unauthorized)
    end

    def crypted_token
      token = request.headers['X-WORKBOOK-TOKEN']
      token ? token.split.last : ''
    end
  end
end
