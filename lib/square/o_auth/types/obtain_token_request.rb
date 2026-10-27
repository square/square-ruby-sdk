# frozen_string_literal: true

module Square
  module OAuth
    module Types
      class ObtainTokenRequest < Internal::Types::Model
        field :client_id, -> { String }, optional: false, nullable: false

        field :client_secret, -> { String }, optional: true, nullable: true

        field :code, -> { String }, optional: true, nullable: true

        field :redirect_uri, -> { String }, optional: true, nullable: true

        field :grant_type, -> { String }, optional: false, nullable: false

        field :refresh_token, -> { String }, optional: true, nullable: true

        field :migration_token, -> { String }, optional: true, nullable: true

        field :scopes, -> { Internal::Types::Array[String] }, optional: true, nullable: true

        field :short_lived, -> { Internal::Types::Boolean }, optional: true, nullable: true

        field :code_verifier, -> { String }, optional: true, nullable: true

        field :use_jwt, -> { Internal::Types::Boolean }, optional: true, nullable: true
      end
    end
  end
end
