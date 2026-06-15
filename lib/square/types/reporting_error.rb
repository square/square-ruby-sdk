# frozen_string_literal: true

module Square
  module Types
    # Error envelope returned by the Reporting API. Note: a 200 response whose body is `{ "error": "Continue wait" }` is
    # not a failure — it signals that a long-running query is still processing and the request should be retried.
    class ReportingError < Internal::Types::Model
      field :error, -> { String }, optional: false, nullable: false
    end
  end
end
