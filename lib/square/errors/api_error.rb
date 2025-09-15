# frozen_string_literal: true

module Square
  module Errors
    class ApiError < StandardError
      attr_reader :code

      def initialize(msg, code:)
        @code = code
        super(msg)
      end

      def self.subclass_for_code(code, msg)
        case code
        when 300..399
          RedirectError.new(_response.body, code: code)
        when 400..499
          ClientError.new(_response.body, code: code)
        when 500..599
          ServerError.new(_response.body, code: code)
        else
          ApiError.new(_response.body, code: code)
        end
      end
    end
  end
end
