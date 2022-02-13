# frozen_string_literal: true

module APP
  module Results
    # Root class for result objects across all application services
    class Base
      attr_reader :data, :errors

      # @param [Object, Array]
      # @param [Array]
      def initialize(data: nil, errors: [])
        @data = data
        @errors = errors
      end

      def success?
        raise NotImplementedError
      end
    end
  end
end
