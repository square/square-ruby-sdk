# frozen_string_literal: true

module Square
  module Labor
    module Types
      class BulkPublishScheduledShiftsRequest < Internal::Types::Model
        field :scheduled_shifts, lambda {
          Internal::Types::Hash[String, Square::Types::BulkPublishScheduledShiftsData]
        }, optional: false, nullable: false
        field :scheduled_shift_notification_audience, lambda {
          Square::Types::ScheduledShiftNotificationAudience
        }, optional: true, nullable: false
      end
    end
  end
end
