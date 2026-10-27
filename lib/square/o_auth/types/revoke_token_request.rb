# frozen_string_literal: true

module Square
  module OAuth
    module Types
      class RevokeTokenRequest < Internal::Types::Model
        field :client_id, -> { String }, optional: true, nullable: true

        field :access_token, -> { String }, optional: true, nullable: true

        field :merchant_id, -> { String }, optional: true, nullable: true

        field :revoke_only_access_token, -> { Internal::Types::Boolean }, optional: true, nullable: true
      end
    end
  end
end
