# frozen_string_literal: true

module Square
  module Types
    # Represents the tax ID associated with a [customer profile](entity:Customer). The corresponding `tax_ids` field is available only for customers of sellers in EU countries or the United Kingdom. 
    # For more information, see [Customer tax IDs](https://developer.squareup.com/docs/customers-api/what-it-does#customer-tax-ids).
    class CustomerTaxIds < Internal::Types::Model
      field :eu_vat, String, optional: true, nullable: false

    end
  end
end
