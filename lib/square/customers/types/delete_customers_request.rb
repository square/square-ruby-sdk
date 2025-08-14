
module Square
  module Customers
    class DeleteCustomersRequest
      field :customer_id, String, optional: false, nullable: false
      field :version, Integer, optional: true, nullable: false

    end
  end
end
