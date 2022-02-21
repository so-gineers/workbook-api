module APP
  module Exceptions
    # Base class for api errors
    class ApiError < ::StandardError
      # @param title  [string]
      # @param detail [string]
      # @param status [integer]
      # @param source [hash]
      def initialize(title: nil, detail: nil, status: nil, source: {})
        @title = title || 'Something went wrong'
        @detail = detail || 'The platform was not able to complete your web request'
        @status = status || 500
        @source = source.deep_stringify_keys
      end

      def to_h
        {
          status: status,
          title: title,
          detail: detail,
          source: source
        }
      end

      def serializable_hash
        to_h
      end

      def to_s
        to_h.to_s
      end

      attr_reader :title, :detail, :status, :source
    end
  end
end
