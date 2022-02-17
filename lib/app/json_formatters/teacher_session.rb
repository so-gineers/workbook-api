# frozen_string_literal: true

module APP
  module JsonFormatters
    class TeacherSession < Blueprinter::Base
      field :id
      field :display_name do |t|
        "Mr #{t.last_name}"
      end
      field :token do |t|
        encoder = Teachers::Tokens::Encoder.new(teacher: t)
        encoder.encoder(secret_key: Rails.application.credentials.jwt_students_secret)
      end
    end
  end
end
