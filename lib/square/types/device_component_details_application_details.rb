# frozen_string_literal: true

module Square
    module Types
        class DeviceComponentDetailsApplicationDetails < Internal::Types::Model
            field :application_type, String, optional: true, nullable: false
            field :version, String, optional: true, nullable: false
            field :session_location, String, optional: true, nullable: false
            field :device_code_id, String, optional: true, nullable: false
        end
    end
end
