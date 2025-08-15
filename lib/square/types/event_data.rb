# frozen_string_literal: true

module Square
  class EventData < Internal::Types::Model
    field :type, String, optional: true, nullable: false
    field :id, String, optional: true, nullable: false
    field :deleted, Internal::Types::Boolean, optional: true, nullable: false
    field :object, Internal::Types::Hash[String, Internal::Types::Hash[String, ]], optional: true, nullable: false

  end
end
