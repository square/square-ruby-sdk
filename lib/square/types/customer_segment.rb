# frozen_string_literal: true

module Square
    module Types
        # Represents a group of customer profiles that match one or more predefined filter criteria. 
        # 
        # Segments (also known as Smart Groups) are defined and created within the Customer Directory in the
        # Square Seller Dashboard or Point of Sale.
        class CustomerSegment < Square::Internal::Types::Model
            field :id, String, optional: true, nullable: false
            field :name, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :updated_at, String, optional: true, nullable: false
        end
    end
end
