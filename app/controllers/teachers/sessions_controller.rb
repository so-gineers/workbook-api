# frozen_string_literal: true

module Teachers
  #  Teacher sessions
  class SessionsController < TeachersBaseController
    add_service :auth_service, ::APP::Teachers::Authentification
    skip_before_action :authenticate_teacher

    rescue_from ::APP::Exceptions::InvalidSession do
      render json: {}, status: :precondition_failed
    end

    rescue_from ::APP::Exceptions::InvalidCredentials do
      render(
        json: {
          message: 'Utilisateur introuvable'
        },
        status: :precondition_failed
      )
    end

    def create
      result = auth_service.authenticate(session: new_session)

      if result.success?
        json = APP::JsonFormatters::TeacherSession.render(result.data)
        render json: json, status: :created
      else
        render json: {}, status: :unprocessable_entity
      end
    end

    private

    def new_session
      ::APP::Teachers::Session.new(session_params)
    end

    def session_params
      params.permit(:identifier, :password)
    end
  end
end
