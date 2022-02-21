module APP
  module Exceptions
    # Base class for api errors
    class ApiError < ::StandardError
      # @param title  [string]
      # @param detail [string]
      # @param status [integer]
      # @param source [hash]
      def initialize
        @title = title
        @detail = detail
        @status = status
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

      def source
        {}
      end

      def detail 
        raise NotImplementedError
      end

      def title
        raise NotImplementedError
      end

      def status
        500
      end
    end
  end
end
