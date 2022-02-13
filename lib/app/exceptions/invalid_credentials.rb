# frozen_string_literal: true

module APP
  module Exceptions
    # Error class raised when a Student or Teacher tries login in the platform
    # with invalid credentials.
    class InvalidCredentials < StandardError
    end
  end
end
