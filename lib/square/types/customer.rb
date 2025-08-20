# frozen_string_literal: true

module Square
  module Types
    # Represents a Square customer profile in the Customer Directory of a Square seller.
    class Customer < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
      field :given_name, -> { String }, optional: true, nullable: false
      field :family_name, -> { String }, optional: true, nullable: false
      field :nickname, -> { String }, optional: true, nullable: false
      field :company_name, -> { String }, optional: true, nullable: false
      field :email_address, -> { String }, optional: true, nullable: false
      field :address, -> { Square::Types::Address }, optional: true, nullable: false
      field :phone_number, -> { String }, optional: true, nullable: false
      field :birthday, -> { String }, optional: true, nullable: false
      field :reference_id, -> { String }, optional: true, nullable: false
      field :note, -> { String }, optional: true, nullable: false
      field :preferences, -> { Square::Types::CustomerPreferences }, optional: true, nullable: false
      field :creation_source, -> { Square::Types::CustomerCreationSource }, optional: true, nullable: false
      field :group_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :segment_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :version, -> { Integer }, optional: true, nullable: false
      field :tax_ids, -> { Square::Types::CustomerTaxIds }, optional: true, nullable: false
    end
  end
end
