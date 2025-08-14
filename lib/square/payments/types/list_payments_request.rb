
module Square
    module Payments
        class ListPaymentsRequest
            field :begin_time, String, optional: true, nullable: false
            field :end_time, String, optional: true, nullable: false
            field :sort_order, String, optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :location_id, String, optional: true, nullable: false
            field :total, Integer, optional: true, nullable: false
            field :last_4, String, optional: true, nullable: false
            field :card_brand, String, optional: true, nullable: false
            field :limit, Integer, optional: true, nullable: false
            field :is_offline_payment, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :offline_begin_time, String, optional: true, nullable: false
            field :offline_end_time, String, optional: true, nullable: false
            field :updated_at_begin_time, String, optional: true, nullable: false
            field :updated_at_end_time, String, optional: true, nullable: false
            field :sort_field, Square::ListPaymentsRequestSortField, optional: true, nullable: false
        end
    end
end
