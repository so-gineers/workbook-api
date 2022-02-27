module APP
  # References
  # https://driggl.com/blog/a/handling-exceptions-in-rails-applications
  module Exceptions
    class TeacherAccountLocked < ApiError
      def status
        422
      end

      def title
        'Account locked'
      end

      def detail
        'Your account is locked please contact support.'
      end
    end

    class TeacherAccountPending < ApiError
      def status
        422
      end

      def title
        'Account locked'
      end

      def detail
        'Your account is locked please contact support.'
      end
    end

    class IdentifiantInconnu < ApiError
      def status
        422
      end

      def title
        'Account locked'
      end

      def detail
        'Your account is locked please contact support.'
      end
    end

    class IdentifiantsIndefinis < ApiError
      def status
        422
      end

      def title
        'Account locked'
      end

      def detail
        'Your account is locked please contact support.'
      end
    end

    class InvalidCredentials < ApiError
      def status
        422
      end

      def title
        'Account locked'
      end

      def detail
        'Your account is locked please contact support.'
      end
    end

    class InvalidSession < ApiError
      def status
        422
      end

      def title
        'Account locked'
      end

      def detail
        'Your account is locked please contact support.'
      end
    end

    class EmptyToken < ApiError
      def status
        422
      end

      def title
        'Account locked'
      end

      def detail
        'Your account is locked please contact support.'
      end
    end
  end
end
