# frozen_string_literal: true

module Teachers
  #  Teacher sessions
  class SessionsController < TeachersBaseController
    rescue_from(
      ::APP::Exceptions::SessionInvalide,
      with: :invalid_session
    )

    rescue_from(
      ::APP::Exceptions::InvalidCredentials,
      with: :invalid_credentials
    )

    skip_before_action :authenticate_teacher

    def create
      result = auth_service.authenticate(session: new_session)

      if result.success?
        render json: { token: result.data.token, id: SecureRandom.uuid, name: 'Mr SENE' }, status: :created
      else
        render json: {}, status: :unprocessable_entity
      end
    end

    def auth_service
      ::APP::Teachers::Authentification.new
    end

    private

    def invalid_session
      render json: {}, status: :precondition_failed
    end

    def new_session
      ::APP::Teachers::Session.new(session_params)
    end

    def session_params
      params.permit(:identifier, :password)
    end

    def invalid_credentials
      render(
        json: { message: 'Utilisateur introuvable' },
        status: :precondition_failed
      )
    end
  end
end
