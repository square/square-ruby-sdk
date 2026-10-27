# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents the result of testing a webhook subscription. Note: The actual API returns these fields at the root
    # level of TestWebhookSubscriptionResponse, not nested under this object.
    class SubscriptionTestResult < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :status_code, -> { Integer }, optional: true, nullable: true

      field :payload, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false

      field :notification_url, -> { String }, optional: true, nullable: false

      field :passes_filter, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
