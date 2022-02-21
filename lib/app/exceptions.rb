module APP
  # References
  # https://driggl.com/blog/a/handling-exceptions-in-rails-applications
  module Exceptions
    class TeacherAccountLocked < ApiError
      def initialize
        super(
          title: 'Account Locked',
          status: 401,
          detail: message || 'Your account is locked',
          source: { pointer: '/request/headers/authorization' }
        )
      end
    end

    class TeacherAccountPending < ApiError
    end

    class IdentifiantInconnu < ApiError
    end

    class IdentifiantsIndefinis < ApiError
    end

    class InvalidCredentials < ApiError
    end

    class InvalidSession < ApiError
    end

    class EmptyToken < ApiError
    end
  end
end
