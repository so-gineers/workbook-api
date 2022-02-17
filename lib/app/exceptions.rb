module APP
  module Exceptions
    class TeacherAccountLocked < StandardError; end
    class TeacherAccountPending < StandardError; end
    class IdentifiantInconnu < StandardError; end
    class IdentifiantsIndefinis < StandardError; end
    class InvalidCredentials < StandardError; end
    class SessionInvalide < StandardError; end
    class TokenVide < StandardError; end
  end
end