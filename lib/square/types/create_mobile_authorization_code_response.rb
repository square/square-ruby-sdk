# frozen_string_literal: true

module Square
    module Types
        # Defines the fields that are included in the response body of
        # a request to the `CreateMobileAuthorizationCode` endpoint.
        class CreateMobileAuthorizationCodeResponse < Internal::Types::Model
            field :authorization_code, String, optional: true, nullable: false
            field :expires_at, String, optional: true, nullable: false
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
