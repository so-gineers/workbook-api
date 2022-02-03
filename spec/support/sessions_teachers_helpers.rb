# frozen_string_literal: true

# Token helpers for teacher@
module SessionsTeachersHelpers
  module_function

  def token_teacher(teacher:)
    APP::Teachers::Tokens::Encoder
      .new(teacher: teacher)
      .encoder(secret_key: Rails.application.credentials.jwt_students_secret)
  end
end
