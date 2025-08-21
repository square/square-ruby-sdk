# frozen_string_literal: true

module Square
  module OAuth
    module Types
      class RevokeTokenRequest < Internal::Types::Model
        field :client_id, -> { String }, optional: true, nullable: false
        field :access_token, -> { String }, optional: true, nullable: false
        field :merchant_id, -> { String }, optional: true, nullable: false
        field :revoke_only_access_token, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
