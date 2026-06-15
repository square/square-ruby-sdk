# frozen_string_literal: true

module Square
  module Types
    class TimeDimension < Internal::Types::Model
      field :dimension, -> { String }, optional: false, nullable: false
      field :granularity, -> { String }, optional: true, nullable: false
      field :date_range, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "dateRange"
    end
  end
end
