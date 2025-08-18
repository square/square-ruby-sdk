# frozen_string_literal: true

module Square
  module Types
    # Represents an error encountered during a request to the Connect API.
    # 
    # See [Handling errors](https://developer.squareup.com/docs/build-basics/handling-errors) for more information.
    class Error < Internal::Types::Model
      field :category, -> { Square::Types::ErrorCategory }, optional: false, nullable: false
      field :code, -> { Square::Types::ErrorCode }, optional: false, nullable: false
      field :detail, -> { String }, optional: true, nullable: false
      field :field, -> { String }, optional: true, nullable: false

    end
  end
end
