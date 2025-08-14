# frozen_string_literal: true

module Square
    module Types
        # Represents one of a business' [locations](https://developer.squareup.com/docs/locations-api).
        class Location < Internal::Types::Model
            field :id, String, optional: true, nullable: false
            field :name, String, optional: true, nullable: false
            field :address, Square::Address, optional: true, nullable: false
            field :timezone, String, optional: true, nullable: false
            field :capabilities, Internal::Types::Array[Square::LocationCapability], optional: true, nullable: false
            field :status, Square::LocationStatus, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :merchant_id, String, optional: true, nullable: false
            field :country, Square::Country, optional: true, nullable: false
            field :language_code, String, optional: true, nullable: false
            field :currency, Square::Currency, optional: true, nullable: false
            field :phone_number, String, optional: true, nullable: false
            field :business_name, String, optional: true, nullable: false
            field :type, Square::LocationType, optional: true, nullable: false
            field :website_url, String, optional: true, nullable: false
            field :business_hours, Square::BusinessHours, optional: true, nullable: false
            field :business_email, String, optional: true, nullable: false
            field :description, String, optional: true, nullable: false
            field :twitter_username, String, optional: true, nullable: false
            field :instagram_username, String, optional: true, nullable: false
            field :facebook_url, String, optional: true, nullable: false
            field :coordinates, Square::Coordinates, optional: true, nullable: false
            field :logo_url, String, optional: true, nullable: false
            field :pos_background_url, String, optional: true, nullable: false
            field :mcc, String, optional: true, nullable: false
            field :full_format_logo_url, String, optional: true, nullable: false
            field :tax_ids, Square::TaxIds, optional: true, nullable: false
        end
    end
end
