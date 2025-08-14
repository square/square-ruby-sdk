# frozen_string_literal: true

module Square
    module Types
        # Defines the customer data provided in individual update requests for a
        # [BulkUpdateCustomers](api-endpoint:Customers-BulkUpdateCustomers) operation.
        class BulkUpdateCustomerData < Square::Internal::Types::Model
            field :given_name, String, optional: true, nullable: false
            field :family_name, String, optional: true, nullable: false
            field :company_name, String, optional: true, nullable: false
            field :nickname, String, optional: true, nullable: false
            field :email_address, String, optional: true, nullable: false
            field :address, Square::Address, optional: true, nullable: false
            field :phone_number, String, optional: true, nullable: false
            field :reference_id, String, optional: true, nullable: false
            field :note, String, optional: true, nullable: false
            field :birthday, String, optional: true, nullable: false
            field :tax_ids, Square::CustomerTaxIds, optional: true, nullable: false
            field :version, Integer, optional: true, nullable: false
        end
    end
end
