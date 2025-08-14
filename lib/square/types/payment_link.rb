# frozen_string_literal: true

module Square
    module Types
        class PaymentLink < Internal::Types::Model
            field :id, String, optional: true, nullable: false
            field :version, Integer, optional: false, nullable: false
            field :description, String, optional: true, nullable: false
            field :order_id, String, optional: true, nullable: false
            field :checkout_options, Square::CheckoutOptions, optional: true, nullable: false
            field :pre_populated_data, Square::PrePopulatedData, optional: true, nullable: false
            field :url, String, optional: true, nullable: false
            field :long_url, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :updated_at, String, optional: true, nullable: false
            field :payment_note, String, optional: true, nullable: false
        end
    end
end
