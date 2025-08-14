# frozen_string_literal: true

module Square
    module Types
        # Defines the fields that are included in the response body of
        # a request to the [RegisterDomain](api-endpoint:ApplePay-RegisterDomain) endpoint.
        # 
        # Either `errors` or `status` are present in a given response (never both).
        class RegisterDomainResponse < Internal::Types::Model
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :status, Square::RegisterDomainResponseStatus, optional: true, nullable: false
        end
    end
end
