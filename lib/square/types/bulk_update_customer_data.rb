# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Defines the customer data provided in individual update requests for a
    # [BulkUpdateCustomers](api-endpoint:Customers-BulkUpdateCustomers) operation.
    class BulkUpdateCustomerData < Internal::Types::Model
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

      field :tax_ids, -> { Square::Types::CustomerTaxIds }, optional: true, nullable: false

      field :version, -> { Integer }, optional: true, nullable: false
    end
  end
end
