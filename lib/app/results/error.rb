# frozen_string_literal: true

module APP
  module Results
    # Defines what an error results looks like in our services
    class Error < Base
      def success?
        false
      end
    end
  end
end
