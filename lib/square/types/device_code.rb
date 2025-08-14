# frozen_string_literal: true

module Square
    module Types
        class DeviceCode < Square::Internal::Types::Model
            field :id, String, optional: true, nullable: false
            field :name, String, optional: true, nullable: false
            field :code, String, optional: true, nullable: false
            field :device_id, String, optional: true, nullable: false
            field :product_type, String, optional: false, nullable: false
            field :location_id, String, optional: true, nullable: false
            field :status, Square::DeviceCodeStatus, optional: true, nullable: false
            field :pair_by, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :status_changed_at, String, optional: true, nullable: false
            field :paired_at, String, optional: true, nullable: false
        end
    end
end
