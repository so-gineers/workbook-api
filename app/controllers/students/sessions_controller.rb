# frozen_string_literal: true

module Students
  # Students sessions
  class SessionsController < Students::BaseController
    skip_before_action :authenticate_student

    rescue_from(
      APP::Exceptions::IdentifiantsIndefinis,
      with: :invalid_credentials
    )
    # **
    # @api {post} /s/sessions/ Create
    #
    # @apiGroup Students/Sessions
    # @apiName PostStudentSession
    # @apiPermission none
    #
    # @apiBody {String} [identifier] Identifier of the student
    # @apiBody {String} [password] Password to authenticate the student
    #
    # @apiSuccess (Response body) {string} token A jwt token
    # @apiSuccessExample {json} Success-Response:
    #   HTTP/1.1 200 OK { token: "a jwt token" }
    #
    # @apiErrorExample {json} Unprocessable entity
    #   HTTP/1.1 422 {}
    # *
    def create
      if auth_service.with_session(**session_params)
        render(json: { token: '' }, status: :ok)
      else
        render(json: {}, status: :unprocessable_entity)
      end
    end

    private

    def session_params
      {
        identifier: params[:identifier],
        password: params[:password]
      }
    end

    def invalid_credentials
      render(json: {}, status: :unprocessable_entity)
    end
  end
end
