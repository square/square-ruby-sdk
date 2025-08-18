# frozen_string_literal: true

module Square
  module Types
    # Represents a postal address in a country. 
    # For more information, see [Working with Addresses](https://developer.squareup.com/docs/build-basics/working-with-addresses).
    class Address < Internal::Types::Model
      field :address_line_1, String, optional: true, nullable: false
      field :address_line_2, String, optional: true, nullable: false
      field :address_line_3, String, optional: true, nullable: false
      field :locality, String, optional: true, nullable: false
      field :sublocality, String, optional: true, nullable: false
      field :sublocality_2, String, optional: true, nullable: false
      field :sublocality_3, String, optional: true, nullable: false
      field :administrative_district_level_1, String, optional: true, nullable: false
      field :administrative_district_level_2, String, optional: true, nullable: false
      field :administrative_district_level_3, String, optional: true, nullable: false
      field :postal_code, String, optional: true, nullable: false
      field :country, Square::Types::Country, optional: true, nullable: false
      field :first_name, String, optional: true, nullable: false
      field :last_name, String, optional: true, nullable: false

    end
  end
end
