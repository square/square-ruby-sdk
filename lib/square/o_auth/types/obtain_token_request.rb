
module Square
  module OAuth
    module Types
      class ObtainTokenRequest < Internal::Types::Model
        field :client_id, String, optional: false, nullable: false
        field :client_secret, String, optional: true, nullable: false
        field :code, String, optional: true, nullable: false
        field :redirect_uri, String, optional: true, nullable: false
        field :grant_type, String, optional: false, nullable: false
        field :refresh_token, String, optional: true, nullable: false
        field :migration_token, String, optional: true, nullable: false
        field :scopes, Internal::Types::Array[String], optional: true, nullable: false
        field :short_lived, Internal::Types::Boolean, optional: true, nullable: false
        field :code_verifier, String, optional: true, nullable: false

      end
    end
  end
end
