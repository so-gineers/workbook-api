# frozen_string_literal: true

module APP
  module Results
    # Defines what a success result looks like
    class Success < Base
      def success?
        true
      end
    end
  end
end
