# frozen_string_literal: true

module Square
  module Customers
    module Types
      class UpdateCustomerRequest < Internal::Types::Model
        field :customer_id, -> { String }, optional: false, nullable: false

        field :given_name, -> { String }, optional: true, nullable: true

        field :family_name, -> { String }, optional: true, nullable: true

        field :company_name, -> { String }, optional: true, nullable: true

        field :nickname, -> { String }, optional: true, nullable: true

        field :email_address, -> { String }, optional: true, nullable: true

        field :address, -> { Square::Types::Address }, optional: true, nullable: false

        field :phone_number, -> { String }, optional: true, nullable: true

        field :reference_id, -> { String }, optional: true, nullable: true

        field :note, -> { String }, optional: true, nullable: true

        field :birthday, -> { String }, optional: true, nullable: true

        field :version, -> { Integer }, optional: true, nullable: false

        field :tax_ids, -> { Square::Types::CustomerTaxIds }, optional: true, nullable: false
      end
    end
  end
end
