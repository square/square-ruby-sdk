# frozen_string_literal: true

module Square
  module Labor
    module Types
      class PublishScheduledShiftRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :idempotency_key, -> { String }, optional: false, nullable: false
        field :version, -> { Integer }, optional: true, nullable: false
        field :scheduled_shift_notification_audience, -> { Square::Types::ScheduledShiftNotificationAudience }, optional: true, nullable: false
      end
    end
  end
end
