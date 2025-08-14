# frozen_string_literal: true

module Square
    module Types
        # Represents the details of a webhook subscription, including notification URL,
        # event types, and signature key.
        class WebhookSubscription < Internal::Types::Model
            field :id, String, optional: true, nullable: false
            field :name, String, optional: true, nullable: false
            field :enabled, Internal::Types::Boolean, optional: true, nullable: false
            field :event_types, Internal::Types::Array[String], optional: true, nullable: false
            field :notification_url, String, optional: true, nullable: false
            field :api_version, String, optional: true, nullable: false
            field :signature_key, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :updated_at, String, optional: true, nullable: false
        end
    end
end
