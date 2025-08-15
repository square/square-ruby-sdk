# frozen_string_literal: true

module Square
  # Represents the details of a webhook subscription, including notification URL,
  # event types, and signature key.
  class SubscriptionTestResult < Internal::Types::Model
    field :id, String, optional: true, nullable: false
    field :status_code, Integer, optional: true, nullable: false
    field :payload, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :updated_at, String, optional: true, nullable: false

  end
end
