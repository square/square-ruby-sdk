# frozen_string_literal: true

module Square
  # Represents a group of customer profiles. 
  # 
  # Customer groups can be created, be modified, and have their membership defined using 
  # the Customers API or within the Customer Directory in the Square Seller Dashboard or Point of Sale.
  class CustomerGroup < Internal::Types::Model
    field :id, String, optional: true, nullable: false
    field :name, String, optional: false, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :updated_at, String, optional: true, nullable: false

  end
end
