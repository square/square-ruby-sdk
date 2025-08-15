# frozen_string_literal: true

module Square
  class DeviceCodePairedEventData < Internal::Types::Model
    field :type, String, optional: true, nullable: false
    field :id, String, optional: true, nullable: false
    field :object, Square::DeviceCodePairedEventObject, optional: true, nullable: false

  end
end
