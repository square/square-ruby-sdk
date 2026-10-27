# frozen_string_literal: true

require "json"
require "net/http"
require "securerandom"
require "time"

require_relative "square/internal/json/serializable"
require_relative "square/internal/types/type"
require_relative "square/internal/types/utils"
require_relative "square/internal/types/union"
require_relative "square/internal/errors/constraint_error"
require_relative "square/internal/errors/type_error"
require_relative "square/internal/http/base_request"
require_relative "square/internal/json/request"
require_relative "square/internal/http/raw_client"
require_relative "square/internal/multipart/multipart_encoder"
require_relative "square/internal/multipart/multipart_form_data_part"
require_relative "square/internal/multipart/multipart_form_data"
require_relative "square/internal/multipart/multipart_request"
require_relative "square/internal/types/model/field"
require_relative "square/internal/types/model"
require_relative "square/internal/types/array"
require_relative "square/internal/types/boolean"
require_relative "square/internal/types/enum"
require_relative "square/internal/types/hash"
require_relative "square/internal/types/unknown"
require_relative "square/errors/api_error"
require_relative "square/errors/response_error"
require_relative "square/errors/client_error"
require_relative "square/errors/redirect_error"
require_relative "square/errors/server_error"
require_relative "square/errors/timeout_error"
require_relative "square/internal/iterators/item_iterator"
require_relative "square/internal/iterators/cursor_item_iterator"
require_relative "square/internal/iterators/offset_item_iterator"
require_relative "square/internal/iterators/cursor_page_iterator"
require_relative "square/internal/iterators/offset_page_iterator"
require_relative "square/errors/connection_error"
require_relative "square/client"
require_relative "square/o_auth/client"
require_relative "square/o_auth/types/revoke_token_request"
require_relative "square/o_auth/types/obtain_token_request"
require_relative "square/v_1_transactions/client"
require_relative "square/v_1_transactions/types/v_1_list_orders_request"
require_relative "square/v_1_transactions/types/v_1_retrieve_order_request"
require_relative "square/v_1_transactions/types/v_1_update_order_request"
require_relative "square/apple_pay/client"
require_relative "square/apple_pay/types/register_domain_request"
require_relative "square/bank_accounts/client"
require_relative "square/bank_accounts/types/list_bank_accounts_request"
require_relative "square/bank_accounts/types/create_bank_account_request"
require_relative "square/bank_accounts/types/get_by_v_1_id_bank_accounts_request"
require_relative "square/bank_accounts/types/get_bank_accounts_request"
require_relative "square/bank_accounts/types/disable_bank_account_request"
require_relative "square/bookings/client"
require_relative "square/bookings/types/list_bookings_request"
require_relative "square/bookings/types/create_booking_request"
require_relative "square/bookings/types/search_availability_request"
require_relative "square/bookings/types/bulk_retrieve_bookings_request"
require_relative "square/bookings/types/retrieve_location_booking_profile_request"
require_relative "square/bookings/types/bulk_retrieve_team_member_booking_profiles_request"
require_relative "square/bookings/types/get_bookings_request"
require_relative "square/bookings/types/update_booking_request"
require_relative "square/bookings/types/cancel_booking_request"
require_relative "square/cards/client"
require_relative "square/cards/types/list_cards_request"
require_relative "square/cards/types/create_card_request"
require_relative "square/cards/types/get_cards_request"
require_relative "square/cards/types/disable_cards_request"
require_relative "square/catalog/client"
require_relative "square/catalog/types/batch_delete_catalog_objects_request"
require_relative "square/catalog/types/batch_get_catalog_objects_request"
require_relative "square/catalog/types/batch_upsert_catalog_objects_request"
require_relative "square/catalog/types/list_catalog_request"
require_relative "square/catalog/types/search_catalog_objects_request"
require_relative "square/catalog/types/search_catalog_items_request"
require_relative "square/catalog/types/update_item_modifier_lists_request"
require_relative "square/catalog/types/update_item_taxes_request"
require_relative "square/channels/client"
require_relative "square/channels/types/list_channels_request"
require_relative "square/channels/types/bulk_retrieve_channels_request"
require_relative "square/channels/types/get_channels_request"
require_relative "square/customers/client"
require_relative "square/customers/types/list_customers_request"
require_relative "square/customers/types/create_customer_request"
require_relative "square/customers/types/bulk_create_customers_request"
require_relative "square/customers/types/bulk_delete_customers_request"
require_relative "square/customers/types/bulk_retrieve_customers_request"
require_relative "square/customers/types/bulk_update_customers_request"
require_relative "square/customers/types/search_customers_request"
require_relative "square/customers/types/get_customers_request"
require_relative "square/customers/types/update_customer_request"
require_relative "square/customers/types/delete_customers_request"
require_relative "square/devices/client"
require_relative "square/devices/types/list_devices_request"
require_relative "square/devices/types/get_devices_request"
require_relative "square/disputes/client"
require_relative "square/disputes/types/list_disputes_request"
require_relative "square/disputes/types/get_disputes_request"
require_relative "square/disputes/types/accept_disputes_request"
require_relative "square/disputes/types/create_evidence_file_disputes_request"
require_relative "square/disputes/types/create_dispute_evidence_text_request"
require_relative "square/disputes/types/submit_evidence_disputes_request"
require_relative "square/employees/client"
require_relative "square/employees/types/list_employees_request"
require_relative "square/employees/types/get_employees_request"
require_relative "square/events/client"
require_relative "square/events/types/search_events_request"
require_relative "square/events/types/list_event_types_request"
require_relative "square/gift_cards/client"
require_relative "square/gift_cards/types/list_gift_cards_request"
require_relative "square/gift_cards/types/create_gift_card_request"
require_relative "square/gift_cards/types/get_gift_card_from_gan_request"
require_relative "square/gift_cards/types/get_gift_card_from_nonce_request"
require_relative "square/gift_cards/types/link_customer_to_gift_card_request"
require_relative "square/gift_cards/types/unlink_customer_from_gift_card_request"
require_relative "square/gift_cards/types/get_gift_cards_request"
require_relative "square/inventory/client"
require_relative "square/inventory/types/list_inventory_adjustment_reasons_request"
require_relative "square/inventory/types/create_inventory_adjustment_reason_request"
require_relative "square/inventory/types/delete_inventory_adjustment_reason_request"
require_relative "square/inventory/types/restore_inventory_adjustment_reason_request"
require_relative "square/inventory/types/retrieve_inventory_adjustment_reason_request"
require_relative "square/inventory/types/update_inventory_adjustment_reason_request"
require_relative "square/inventory/types/deprecated_get_adjustment_inventory_request"
require_relative "square/inventory/types/update_inventory_adjustment_request"
require_relative "square/inventory/types/get_adjustment_inventory_request"
require_relative "square/inventory/types/deprecated_get_physical_count_inventory_request"
require_relative "square/inventory/types/get_physical_count_inventory_request"
require_relative "square/inventory/types/get_inventory_request"
require_relative "square/inventory/types/changes_inventory_request"
require_relative "square/invoices/client"
require_relative "square/invoices/types/list_invoices_request"
require_relative "square/invoices/types/create_invoice_request"
require_relative "square/invoices/types/search_invoices_request"
require_relative "square/invoices/types/get_invoices_request"
require_relative "square/invoices/types/update_invoice_request"
require_relative "square/invoices/types/delete_invoices_request"
require_relative "square/invoices/types/create_invoice_attachment_request"
require_relative "square/invoices/types/delete_invoice_attachment_request"
require_relative "square/invoices/types/cancel_invoice_request"
require_relative "square/invoices/types/publish_invoice_request"
require_relative "square/labor/client"
require_relative "square/labor/types/create_scheduled_shift_request"
require_relative "square/labor/types/bulk_publish_scheduled_shifts_request"
require_relative "square/labor/types/search_scheduled_shifts_request"
require_relative "square/labor/types/retrieve_scheduled_shift_request"
require_relative "square/labor/types/update_scheduled_shift_request"
require_relative "square/labor/types/publish_scheduled_shift_request"
require_relative "square/labor/types/create_timecard_request"
require_relative "square/labor/types/search_timecards_request"
require_relative "square/labor/types/retrieve_timecard_request"
require_relative "square/labor/types/update_timecard_request"
require_relative "square/labor/types/delete_timecard_request"
require_relative "square/locations/client"
require_relative "square/locations/types/create_location_request"
require_relative "square/locations/types/get_locations_request"
require_relative "square/locations/types/update_location_request"
require_relative "square/locations/types/create_checkout_request"
require_relative "square/loyalty/client"
require_relative "square/loyalty/types/search_loyalty_events_request"
require_relative "square/merchants/client"
require_relative "square/merchants/types/list_merchants_request"
require_relative "square/merchants/types/get_merchants_request"
require_relative "square/checkout/client"
require_relative "square/checkout/types/retrieve_location_settings_request"
require_relative "square/checkout/types/update_location_settings_request"
require_relative "square/checkout/types/update_merchant_settings_request"
require_relative "square/orders/client"
require_relative "square/orders/types/batch_get_orders_request"
require_relative "square/orders/types/calculate_order_request"
require_relative "square/orders/types/clone_order_request"
require_relative "square/orders/types/search_orders_request"
require_relative "square/orders/types/get_orders_request"
require_relative "square/orders/types/update_order_request"
require_relative "square/orders/types/pay_order_request"
require_relative "square/payments/client"
require_relative "square/payments/types/list_payments_request"
require_relative "square/payments/types/create_payment_request"
require_relative "square/payments/types/cancel_payment_by_idempotency_key_request"
require_relative "square/payments/types/get_payments_request"
require_relative "square/payments/types/update_payment_request"
require_relative "square/payments/types/cancel_payments_request"
require_relative "square/payments/types/complete_payment_request"
require_relative "square/payouts/client"
require_relative "square/payouts/types/list_payouts_request"
require_relative "square/payouts/types/get_payouts_request"
require_relative "square/payouts/types/list_entries_payouts_request"
require_relative "square/refunds/client"
require_relative "square/refunds/types/list_refunds_request"
require_relative "square/refunds/types/refund_payment_request"
require_relative "square/refunds/types/get_refunds_request"
require_relative "square/sites/client"
require_relative "square/snippets/client"
require_relative "square/snippets/types/get_snippets_request"
require_relative "square/snippets/types/upsert_snippet_request"
require_relative "square/snippets/types/delete_snippets_request"
require_relative "square/subscriptions/client"
require_relative "square/subscriptions/types/create_subscription_request"
require_relative "square/subscriptions/types/bulk_swap_plan_request"
require_relative "square/subscriptions/types/search_subscriptions_request"
require_relative "square/subscriptions/types/get_subscriptions_request"
require_relative "square/subscriptions/types/update_subscription_request"
require_relative "square/subscriptions/types/delete_action_subscriptions_request"
require_relative "square/subscriptions/types/change_billing_anchor_date_request"
require_relative "square/subscriptions/types/cancel_subscriptions_request"
require_relative "square/subscriptions/types/list_events_subscriptions_request"
require_relative "square/subscriptions/types/pause_subscription_request"
require_relative "square/subscriptions/types/resume_subscription_request"
require_relative "square/subscriptions/types/swap_plan_request"
require_relative "square/team_members/client"
require_relative "square/team_members/types/batch_create_team_members_request"
require_relative "square/team_members/types/batch_update_team_members_request"
require_relative "square/team_members/types/search_team_members_request"
require_relative "square/team_members/types/get_team_members_request"
require_relative "square/team_members/types/update_team_members_request"
require_relative "square/team/client"
require_relative "square/team/types/list_jobs_request"
require_relative "square/team/types/create_job_request"
require_relative "square/team/types/retrieve_job_request"
require_relative "square/team/types/update_job_request"
require_relative "square/terminal/client"
require_relative "square/terminal/types/dismiss_terminal_action_request"
require_relative "square/terminal/types/dismiss_terminal_checkout_request"
require_relative "square/terminal/types/dismiss_terminal_refund_request"
require_relative "square/transfer_orders/client"
require_relative "square/transfer_orders/types/create_transfer_order_request"
require_relative "square/transfer_orders/types/search_transfer_orders_request"
require_relative "square/transfer_orders/types/get_transfer_orders_request"
require_relative "square/transfer_orders/types/update_transfer_order_request"
require_relative "square/transfer_orders/types/delete_transfer_orders_request"
require_relative "square/transfer_orders/types/cancel_transfer_order_request"
require_relative "square/transfer_orders/types/receive_transfer_order_request"
require_relative "square/transfer_orders/types/start_transfer_order_request"
require_relative "square/vendors/client"
require_relative "square/vendors/types/batch_create_vendors_request"
require_relative "square/vendors/types/batch_get_vendors_request"
require_relative "square/vendors/types/batch_update_vendors_request"
require_relative "square/vendors/types/create_vendor_request"
require_relative "square/vendors/types/search_vendors_request"
require_relative "square/vendors/types/get_vendors_request"
require_relative "square/vendors/types/update_vendors_request"
require_relative "square/reporting/client"
require_relative "square/reporting/types/load_request"
require_relative "square/bookings/custom_attribute_definitions/client"
require_relative "square/bookings/custom_attribute_definitions/types/list_custom_attribute_definitions_request"
require_relative "square/bookings/custom_attribute_definitions/types/create_booking_custom_attribute_definition_request"
require_relative "square/bookings/custom_attribute_definitions/types/get_custom_attribute_definitions_request"
require_relative "square/bookings/custom_attribute_definitions/types/update_booking_custom_attribute_definition_request"
require_relative "square/bookings/custom_attribute_definitions/types/delete_custom_attribute_definitions_request"
require_relative "square/bookings/custom_attributes/client"
require_relative "square/bookings/custom_attributes/types/bulk_delete_booking_custom_attributes_request"
require_relative "square/bookings/custom_attributes/types/bulk_upsert_booking_custom_attributes_request"
require_relative "square/bookings/custom_attributes/types/list_custom_attributes_request"
require_relative "square/bookings/custom_attributes/types/get_custom_attributes_request"
require_relative "square/bookings/custom_attributes/types/upsert_booking_custom_attribute_request"
require_relative "square/bookings/custom_attributes/types/delete_custom_attributes_request"
require_relative "square/bookings/location_profiles/client"
require_relative "square/bookings/location_profiles/types/list_location_profiles_request"
require_relative "square/bookings/team_member_profiles/client"
require_relative "square/bookings/team_member_profiles/types/list_team_member_profiles_request"
require_relative "square/bookings/team_member_profiles/types/get_team_member_profiles_request"
require_relative "square/cash_drawers/client"
require_relative "square/cash_drawers/shifts/client"
require_relative "square/cash_drawers/shifts/types/list_shifts_request"
require_relative "square/cash_drawers/shifts/types/get_shifts_request"
require_relative "square/cash_drawers/shifts/types/list_events_shifts_request"
require_relative "square/catalog/images/client"
require_relative "square/catalog/images/types/create_images_request"
require_relative "square/catalog/images/types/update_images_request"
require_relative "square/catalog/object/client"
require_relative "square/catalog/object/types/upsert_catalog_object_request"
require_relative "square/catalog/object/types/get_object_request"
require_relative "square/catalog/object/types/delete_object_request"
require_relative "square/checkout/payment_links/client"
require_relative "square/checkout/payment_links/types/list_payment_links_request"
require_relative "square/checkout/payment_links/types/create_payment_link_request"
require_relative "square/checkout/payment_links/types/get_payment_links_request"
require_relative "square/checkout/payment_links/types/update_payment_link_request"
require_relative "square/checkout/payment_links/types/delete_payment_links_request"
require_relative "square/customers/custom_attribute_definitions/client"
require_relative "square/customers/custom_attribute_definitions/types/list_custom_attribute_definitions_request"
require_relative "square/customers/custom_attribute_definitions/types/create_customer_custom_attribute_definition_request"
require_relative "square/customers/custom_attribute_definitions/types/get_custom_attribute_definitions_request"
require_relative "square/customers/custom_attribute_definitions/types/update_customer_custom_attribute_definition_request"
require_relative "square/customers/custom_attribute_definitions/types/delete_custom_attribute_definitions_request"
require_relative "square/customers/custom_attribute_definitions/types/batch_upsert_customer_custom_attributes_request"
require_relative "square/customers/groups/client"
require_relative "square/customers/groups/types/list_groups_request"
require_relative "square/customers/groups/types/create_customer_group_request"
require_relative "square/customers/groups/types/get_groups_request"
require_relative "square/customers/groups/types/update_customer_group_request"
require_relative "square/customers/groups/types/delete_groups_request"
require_relative "square/customers/groups/types/add_groups_request"
require_relative "square/customers/groups/types/remove_groups_request"
require_relative "square/customers/segments/client"
require_relative "square/customers/segments/types/list_segments_request"
require_relative "square/customers/segments/types/get_segments_request"
require_relative "square/customers/cards/client"
require_relative "square/customers/cards/types/create_customer_card_request"
require_relative "square/customers/cards/types/delete_cards_request"
require_relative "square/customers/custom_attributes/client"
require_relative "square/customers/custom_attributes/types/list_custom_attributes_request"
require_relative "square/customers/custom_attributes/types/get_custom_attributes_request"
require_relative "square/customers/custom_attributes/types/upsert_customer_custom_attribute_request"
require_relative "square/customers/custom_attributes/types/delete_custom_attributes_request"
require_relative "square/devices/codes/client"
require_relative "square/devices/codes/types/list_codes_request"
require_relative "square/devices/codes/types/create_device_code_request"
require_relative "square/devices/codes/types/get_codes_request"
require_relative "square/disputes/evidence/client"
require_relative "square/disputes/evidence/types/list_evidence_request"
require_relative "square/disputes/evidence/types/get_evidence_request"
require_relative "square/disputes/evidence/types/delete_evidence_request"
require_relative "square/gift_cards/activities/client"
require_relative "square/gift_cards/activities/types/list_activities_request"
require_relative "square/gift_cards/activities/types/create_gift_card_activity_request"
require_relative "square/labor/break_types/client"
require_relative "square/labor/break_types/types/list_break_types_request"
require_relative "square/labor/break_types/types/create_break_type_request"
require_relative "square/labor/break_types/types/get_break_types_request"
require_relative "square/labor/break_types/types/update_break_type_request"
require_relative "square/labor/break_types/types/delete_break_types_request"
require_relative "square/labor/employee_wages/client"
require_relative "square/labor/employee_wages/types/list_employee_wages_request"
require_relative "square/labor/employee_wages/types/get_employee_wages_request"
require_relative "square/labor/shifts/client"
require_relative "square/labor/shifts/types/create_shift_request"
require_relative "square/labor/shifts/types/search_shifts_request"
require_relative "square/labor/shifts/types/get_shifts_request"
require_relative "square/labor/shifts/types/update_shift_request"
require_relative "square/labor/shifts/types/delete_shifts_request"
require_relative "square/labor/team_member_wages/client"
require_relative "square/labor/team_member_wages/types/list_team_member_wages_request"
require_relative "square/labor/team_member_wages/types/get_team_member_wages_request"
require_relative "square/labor/workweek_configs/client"
require_relative "square/labor/workweek_configs/types/list_workweek_configs_request"
require_relative "square/labor/workweek_configs/types/update_workweek_config_request"
require_relative "square/locations/custom_attribute_definitions/client"
require_relative "square/locations/custom_attribute_definitions/types/list_custom_attribute_definitions_request"
require_relative "square/locations/custom_attribute_definitions/types/create_location_custom_attribute_definition_request"
require_relative "square/locations/custom_attribute_definitions/types/get_custom_attribute_definitions_request"
require_relative "square/locations/custom_attribute_definitions/types/update_location_custom_attribute_definition_request"
require_relative "square/locations/custom_attribute_definitions/types/delete_custom_attribute_definitions_request"
require_relative "square/locations/custom_attributes/client"
require_relative "square/locations/custom_attributes/types/bulk_delete_location_custom_attributes_request"
require_relative "square/locations/custom_attributes/types/bulk_upsert_location_custom_attributes_request"
require_relative "square/locations/custom_attributes/types/list_custom_attributes_request"
require_relative "square/locations/custom_attributes/types/get_custom_attributes_request"
require_relative "square/locations/custom_attributes/types/upsert_location_custom_attribute_request"
require_relative "square/locations/custom_attributes/types/delete_custom_attributes_request"
require_relative "square/locations/transactions/client"
require_relative "square/locations/transactions/types/list_transactions_request"
require_relative "square/locations/transactions/types/get_transactions_request"
require_relative "square/loyalty/accounts/client"
require_relative "square/loyalty/accounts/types/create_loyalty_account_request"
require_relative "square/loyalty/accounts/types/search_loyalty_accounts_request"
require_relative "square/loyalty/accounts/types/get_accounts_request"
require_relative "square/loyalty/accounts/types/accumulate_loyalty_points_request"
require_relative "square/loyalty/accounts/types/adjust_loyalty_points_request"
require_relative "square/loyalty/programs/client"
require_relative "square/loyalty/programs/types/get_programs_request"
require_relative "square/loyalty/programs/types/calculate_loyalty_points_request"
require_relative "square/loyalty/rewards/client"
require_relative "square/loyalty/rewards/types/create_loyalty_reward_request"
require_relative "square/loyalty/rewards/types/search_loyalty_rewards_request"
require_relative "square/loyalty/rewards/types/get_rewards_request"
require_relative "square/loyalty/rewards/types/delete_rewards_request"
require_relative "square/loyalty/rewards/types/redeem_loyalty_reward_request"
require_relative "square/loyalty/programs/promotions/client"
require_relative "square/loyalty/programs/promotions/types/list_promotions_request"
require_relative "square/loyalty/programs/promotions/types/create_loyalty_promotion_request"
require_relative "square/loyalty/programs/promotions/types/get_promotions_request"
require_relative "square/loyalty/programs/promotions/types/cancel_promotions_request"
require_relative "square/merchants/custom_attribute_definitions/client"
require_relative "square/merchants/custom_attribute_definitions/types/list_custom_attribute_definitions_request"
require_relative "square/merchants/custom_attribute_definitions/types/create_merchant_custom_attribute_definition_request"
require_relative "square/merchants/custom_attribute_definitions/types/get_custom_attribute_definitions_request"
require_relative "square/merchants/custom_attribute_definitions/types/update_merchant_custom_attribute_definition_request"
require_relative "square/merchants/custom_attribute_definitions/types/delete_custom_attribute_definitions_request"
require_relative "square/merchants/custom_attributes/client"
require_relative "square/merchants/custom_attributes/types/bulk_delete_merchant_custom_attributes_request"
require_relative "square/merchants/custom_attributes/types/bulk_upsert_merchant_custom_attributes_request"
require_relative "square/merchants/custom_attributes/types/list_custom_attributes_request"
require_relative "square/merchants/custom_attributes/types/get_custom_attributes_request"
require_relative "square/merchants/custom_attributes/types/upsert_merchant_custom_attribute_request"
require_relative "square/merchants/custom_attributes/types/delete_custom_attributes_request"
require_relative "square/orders/custom_attribute_definitions/client"
require_relative "square/orders/custom_attribute_definitions/types/list_custom_attribute_definitions_request"
require_relative "square/orders/custom_attribute_definitions/types/create_order_custom_attribute_definition_request"
require_relative "square/orders/custom_attribute_definitions/types/get_custom_attribute_definitions_request"
require_relative "square/orders/custom_attribute_definitions/types/update_order_custom_attribute_definition_request"
require_relative "square/orders/custom_attribute_definitions/types/delete_custom_attribute_definitions_request"
require_relative "square/orders/custom_attributes/client"
require_relative "square/orders/custom_attributes/types/bulk_delete_order_custom_attributes_request"
require_relative "square/orders/custom_attributes/types/bulk_upsert_order_custom_attributes_request"
require_relative "square/orders/custom_attributes/types/list_custom_attributes_request"
require_relative "square/orders/custom_attributes/types/get_custom_attributes_request"
require_relative "square/orders/custom_attributes/types/upsert_order_custom_attribute_request"
require_relative "square/orders/custom_attributes/types/delete_custom_attributes_request"
require_relative "square/team_members/wage_setting/client"
require_relative "square/team_members/wage_setting/types/get_wage_setting_request"
require_relative "square/team_members/wage_setting/types/update_wage_setting_request"
require_relative "square/terminal/actions/client"
require_relative "square/terminal/actions/types/create_terminal_action_request"
require_relative "square/terminal/actions/types/search_terminal_actions_request"
require_relative "square/terminal/actions/types/get_actions_request"
require_relative "square/terminal/actions/types/cancel_actions_request"
require_relative "square/terminal/checkouts/client"
require_relative "square/terminal/checkouts/types/create_terminal_checkout_request"
require_relative "square/terminal/checkouts/types/search_terminal_checkouts_request"
require_relative "square/terminal/checkouts/types/get_checkouts_request"
require_relative "square/terminal/checkouts/types/cancel_checkouts_request"
require_relative "square/terminal/refunds/client"
require_relative "square/terminal/refunds/types/create_terminal_refund_request"
require_relative "square/terminal/refunds/types/search_terminal_refunds_request"
require_relative "square/terminal/refunds/types/get_refunds_request"
require_relative "square/terminal/refunds/types/cancel_refunds_request"
require_relative "square/webhooks/client"
require_relative "square/webhooks/event_types/client"
require_relative "square/webhooks/event_types/types/list_event_types_request"
require_relative "square/webhooks/subscriptions/client"
require_relative "square/webhooks/subscriptions/types/list_subscriptions_request"
require_relative "square/webhooks/subscriptions/types/create_webhook_subscription_request"
require_relative "square/webhooks/subscriptions/types/get_subscriptions_request"
require_relative "square/webhooks/subscriptions/types/update_webhook_subscription_request"
require_relative "square/webhooks/subscriptions/types/delete_subscriptions_request"
require_relative "square/webhooks/subscriptions/types/update_webhook_subscription_signature_key_request"
require_relative "square/webhooks/subscriptions/types/test_webhook_subscription_request"
require_relative "square/environment"

module Square
  module Types
    autoload :AchDetails, ::File.join(__dir__, "square/types/ach_details")
    autoload :CardBrand, ::File.join(__dir__, "square/types/card_brand")
    autoload :Currency, ::File.join(__dir__, "square/types/currency")
    autoload :DisputeReason, ::File.join(__dir__, "square/types/dispute_reason")
    autoload :DisputeState, ::File.join(__dir__, "square/types/dispute_state")
    autoload :DisputedPayment, ::File.join(__dir__, "square/types/disputed_payment")
    autoload :Money, ::File.join(__dir__, "square/types/money")
    autoload :Dispute, ::File.join(__dir__, "square/types/dispute")
    autoload :ErrorCategory, ::File.join(__dir__, "square/types/error_category")
    autoload :ErrorCode, ::File.join(__dir__, "square/types/error_code")
    autoload :Error, ::File.join(__dir__, "square/types/error")
    autoload :AcceptDisputeResponse, ::File.join(__dir__, "square/types/accept_dispute_response")
    autoload :AcceptedPaymentMethods, ::File.join(__dir__, "square/types/accepted_payment_methods")
    autoload :LoyaltyEventAccumulatePoints, ::File.join(__dir__, "square/types/loyalty_event_accumulate_points")
    autoload :LoyaltyEventAccumulatePromotionPoints, ::File.join(__dir__, "square/types/loyalty_event_accumulate_promotion_points")
    autoload :LoyaltyEventAdjustPoints, ::File.join(__dir__, "square/types/loyalty_event_adjust_points")
    autoload :LoyaltyEventCreateReward, ::File.join(__dir__, "square/types/loyalty_event_create_reward")
    autoload :LoyaltyEventDeleteReward, ::File.join(__dir__, "square/types/loyalty_event_delete_reward")
    autoload :LoyaltyEventExpirePoints, ::File.join(__dir__, "square/types/loyalty_event_expire_points")
    autoload :LoyaltyEventOther, ::File.join(__dir__, "square/types/loyalty_event_other")
    autoload :LoyaltyEventRedeemReward, ::File.join(__dir__, "square/types/loyalty_event_redeem_reward")
    autoload :LoyaltyEventSource, ::File.join(__dir__, "square/types/loyalty_event_source")
    autoload :LoyaltyEventType, ::File.join(__dir__, "square/types/loyalty_event_type")
    autoload :LoyaltyEvent, ::File.join(__dir__, "square/types/loyalty_event")
    autoload :AccumulateLoyaltyPointsResponse, ::File.join(__dir__, "square/types/accumulate_loyalty_points_response")
    autoload :ActionCancelReason, ::File.join(__dir__, "square/types/action_cancel_reason")
    autoload :ActivityType, ::File.join(__dir__, "square/types/activity_type")
    autoload :AddGroupToCustomerResponse, ::File.join(__dir__, "square/types/add_group_to_customer_response")
    autoload :AdditionalRecipient, ::File.join(__dir__, "square/types/additional_recipient")
    autoload :Country, ::File.join(__dir__, "square/types/country")
    autoload :Address, ::File.join(__dir__, "square/types/address")
    autoload :AdjustLoyaltyPointsResponse, ::File.join(__dir__, "square/types/adjust_loyalty_points_response")
    autoload :AfterpayDetails, ::File.join(__dir__, "square/types/afterpay_details")
    autoload :ApplicationDetailsExternalSquareProduct, ::File.join(__dir__, "square/types/application_details_external_square_product")
    autoload :ApplicationDetails, ::File.join(__dir__, "square/types/application_details")
    autoload :ApplicationType, ::File.join(__dir__, "square/types/application_type")
    autoload :AppointmentSegment, ::File.join(__dir__, "square/types/appointment_segment")
    autoload :ArchivedState, ::File.join(__dir__, "square/types/archived_state")
    autoload :Availability, ::File.join(__dir__, "square/types/availability")
    autoload :BankAccountStatus, ::File.join(__dir__, "square/types/bank_account_status")
    autoload :BankAccountType, ::File.join(__dir__, "square/types/bank_account_type")
    autoload :BankAccount, ::File.join(__dir__, "square/types/bank_account")
    autoload :BankAccountCreatedEventObject, ::File.join(__dir__, "square/types/bank_account_created_event_object")
    autoload :BankAccountCreatedEventData, ::File.join(__dir__, "square/types/bank_account_created_event_data")
    autoload :BankAccountCreatedEvent, ::File.join(__dir__, "square/types/bank_account_created_event")
    autoload :BankAccountDisabledEventObject, ::File.join(__dir__, "square/types/bank_account_disabled_event_object")
    autoload :BankAccountDisabledEventData, ::File.join(__dir__, "square/types/bank_account_disabled_event_data")
    autoload :BankAccountDisabledEvent, ::File.join(__dir__, "square/types/bank_account_disabled_event")
    autoload :BankAccountPaymentDetails, ::File.join(__dir__, "square/types/bank_account_payment_details")
    autoload :BankAccountVerifiedEventObject, ::File.join(__dir__, "square/types/bank_account_verified_event_object")
    autoload :BankAccountVerifiedEventData, ::File.join(__dir__, "square/types/bank_account_verified_event_data")
    autoload :BankAccountVerifiedEvent, ::File.join(__dir__, "square/types/bank_account_verified_event")
    autoload :MeasurementUnitArea, ::File.join(__dir__, "square/types/measurement_unit_area")
    autoload :MeasurementUnitCustom, ::File.join(__dir__, "square/types/measurement_unit_custom")
    autoload :MeasurementUnitGeneric, ::File.join(__dir__, "square/types/measurement_unit_generic")
    autoload :MeasurementUnitLength, ::File.join(__dir__, "square/types/measurement_unit_length")
    autoload :MeasurementUnitTime, ::File.join(__dir__, "square/types/measurement_unit_time")
    autoload :MeasurementUnitUnitType, ::File.join(__dir__, "square/types/measurement_unit_unit_type")
    autoload :MeasurementUnitVolume, ::File.join(__dir__, "square/types/measurement_unit_volume")
    autoload :MeasurementUnitWeight, ::File.join(__dir__, "square/types/measurement_unit_weight")
    autoload :MeasurementUnit, ::File.join(__dir__, "square/types/measurement_unit")
    autoload :CatalogMeasurementUnit, ::File.join(__dir__, "square/types/catalog_measurement_unit")
    autoload :InventoryState, ::File.join(__dir__, "square/types/inventory_state")
    autoload :InventoryAdjustmentGroup, ::File.join(__dir__, "square/types/inventory_adjustment_group")
    autoload :InventoryAdjustmentReasonIdType, ::File.join(__dir__, "square/types/inventory_adjustment_reason_id_type")
    autoload :InventoryAdjustmentReasonId, ::File.join(__dir__, "square/types/inventory_adjustment_reason_id")
    autoload :Product, ::File.join(__dir__, "square/types/product")
    autoload :SourceApplication, ::File.join(__dir__, "square/types/source_application")
    autoload :InventoryAdjustment, ::File.join(__dir__, "square/types/inventory_adjustment")
    autoload :InventoryChangeType, ::File.join(__dir__, "square/types/inventory_change_type")
    autoload :InventoryPhysicalCount, ::File.join(__dir__, "square/types/inventory_physical_count")
    autoload :InventoryChange, ::File.join(__dir__, "square/types/inventory_change")
    autoload :BatchChangeInventoryRequest, ::File.join(__dir__, "square/types/batch_change_inventory_request")
    autoload :InventoryCount, ::File.join(__dir__, "square/types/inventory_count")
    autoload :BatchChangeInventoryResponse, ::File.join(__dir__, "square/types/batch_change_inventory_response")
    autoload :BatchDeleteCatalogObjectsResponse, ::File.join(__dir__, "square/types/batch_delete_catalog_objects_response")
    autoload :DayOfWeek, ::File.join(__dir__, "square/types/day_of_week")
    autoload :CatalogAvailabilityPeriod, ::File.join(__dir__, "square/types/catalog_availability_period")
    autoload :CatalogCategoryType, ::File.join(__dir__, "square/types/catalog_category_type")
    autoload :CatalogCustomAttributeDefinitionType, ::File.join(__dir__, "square/types/catalog_custom_attribute_definition_type")
    autoload :CatalogCustomAttributeValue, ::File.join(__dir__, "square/types/catalog_custom_attribute_value")
    autoload :CatalogEcomSeoData, ::File.join(__dir__, "square/types/catalog_ecom_seo_data")
    autoload :CatalogV1Id, ::File.join(__dir__, "square/types/catalog_v_1_id")
    autoload :CategoryPathToRootNode, ::File.join(__dir__, "square/types/category_path_to_root_node")
    autoload :CatalogObjectBase, ::File.join(__dir__, "square/types/catalog_object_base")
    autoload :CatalogObjectCategory, ::File.join(__dir__, "square/types/catalog_object_category")
    autoload :CatalogCategory, ::File.join(__dir__, "square/types/catalog_category")
    autoload :CatalogCustomAttributeDefinitionAppVisibility, ::File.join(__dir__, "square/types/catalog_custom_attribute_definition_app_visibility")
    autoload :CatalogCustomAttributeDefinitionNumberConfig, ::File.join(__dir__, "square/types/catalog_custom_attribute_definition_number_config")
    autoload :CatalogCustomAttributeDefinitionSelectionConfigCustomAttributeSelection, ::File.join(__dir__, "square/types/catalog_custom_attribute_definition_selection_config_custom_attribute_selection")
    autoload :CatalogCustomAttributeDefinitionSelectionConfig, ::File.join(__dir__, "square/types/catalog_custom_attribute_definition_selection_config")
    autoload :CatalogCustomAttributeDefinitionSellerVisibility, ::File.join(__dir__, "square/types/catalog_custom_attribute_definition_seller_visibility")
    autoload :CatalogCustomAttributeDefinitionStringConfig, ::File.join(__dir__, "square/types/catalog_custom_attribute_definition_string_config")
    autoload :CatalogObjectType, ::File.join(__dir__, "square/types/catalog_object_type")
    autoload :CatalogCustomAttributeDefinition, ::File.join(__dir__, "square/types/catalog_custom_attribute_definition")
    autoload :CatalogDiscountModifyTaxBasis, ::File.join(__dir__, "square/types/catalog_discount_modify_tax_basis")
    autoload :CatalogDiscountType, ::File.join(__dir__, "square/types/catalog_discount_type")
    autoload :CatalogDiscount, ::File.join(__dir__, "square/types/catalog_discount")
    autoload :CatalogImage, ::File.join(__dir__, "square/types/catalog_image")
    autoload :CatalogItemFoodAndBeverageDetailsDietaryPreferenceStandardDietaryPreference, ::File.join(__dir__, "square/types/catalog_item_food_and_beverage_details_dietary_preference_standard_dietary_preference")
    autoload :CatalogItemFoodAndBeverageDetailsDietaryPreferenceType, ::File.join(__dir__, "square/types/catalog_item_food_and_beverage_details_dietary_preference_type")
    autoload :CatalogItemFoodAndBeverageDetailsDietaryPreference, ::File.join(__dir__, "square/types/catalog_item_food_and_beverage_details_dietary_preference")
    autoload :CatalogItemFoodAndBeverageDetailsIngredientStandardIngredient, ::File.join(__dir__, "square/types/catalog_item_food_and_beverage_details_ingredient_standard_ingredient")
    autoload :CatalogItemFoodAndBeverageDetailsIngredient, ::File.join(__dir__, "square/types/catalog_item_food_and_beverage_details_ingredient")
    autoload :CatalogItemFoodAndBeverageDetails, ::File.join(__dir__, "square/types/catalog_item_food_and_beverage_details")
    autoload :CatalogModifierToggleOverrideType, ::File.join(__dir__, "square/types/catalog_modifier_toggle_override_type")
    autoload :CatalogModifierOverride, ::File.join(__dir__, "square/types/catalog_modifier_override")
    autoload :CatalogItemModifierListInfo, ::File.join(__dir__, "square/types/catalog_item_modifier_list_info")
    autoload :CatalogItemOptionForItem, ::File.join(__dir__, "square/types/catalog_item_option_for_item")
    autoload :CatalogItemOptionValue, ::File.join(__dir__, "square/types/catalog_item_option_value")
    autoload :CatalogItemOptionValueForItemVariation, ::File.join(__dir__, "square/types/catalog_item_option_value_for_item_variation")
    autoload :CatalogItemProductType, ::File.join(__dir__, "square/types/catalog_item_product_type")
    autoload :CatalogItemVariationVendorInformation, ::File.join(__dir__, "square/types/catalog_item_variation_vendor_information")
    autoload :CatalogPricingType, ::File.join(__dir__, "square/types/catalog_pricing_type")
    autoload :CatalogStockConversion, ::File.join(__dir__, "square/types/catalog_stock_conversion")
    autoload :InventoryAlertType, ::File.join(__dir__, "square/types/inventory_alert_type")
    autoload :ItemVariationLocationOverrides, ::File.join(__dir__, "square/types/item_variation_location_overrides")
    autoload :CatalogItemVariation, ::File.join(__dir__, "square/types/catalog_item_variation")
    autoload :ModifierLocationOverrides, ::File.join(__dir__, "square/types/modifier_location_overrides")
    autoload :CatalogModifier, ::File.join(__dir__, "square/types/catalog_modifier")
    autoload :CatalogModifierListModifierType, ::File.join(__dir__, "square/types/catalog_modifier_list_modifier_type")
    autoload :CatalogModifierListSelectionType, ::File.join(__dir__, "square/types/catalog_modifier_list_selection_type")
    autoload :ExcludeStrategy, ::File.join(__dir__, "square/types/exclude_strategy")
    autoload :CatalogPricingRule, ::File.join(__dir__, "square/types/catalog_pricing_rule")
    autoload :CatalogProductSet, ::File.join(__dir__, "square/types/catalog_product_set")
    autoload :CatalogQuickAmountType, ::File.join(__dir__, "square/types/catalog_quick_amount_type")
    autoload :CatalogQuickAmount, ::File.join(__dir__, "square/types/catalog_quick_amount")
    autoload :CatalogQuickAmountsSettingsOption, ::File.join(__dir__, "square/types/catalog_quick_amounts_settings_option")
    autoload :CatalogQuickAmountsSettings, ::File.join(__dir__, "square/types/catalog_quick_amounts_settings")
    autoload :SubscriptionCadence, ::File.join(__dir__, "square/types/subscription_cadence")
    autoload :SubscriptionPricingType, ::File.join(__dir__, "square/types/subscription_pricing_type")
    autoload :SubscriptionPricing, ::File.join(__dir__, "square/types/subscription_pricing")
    autoload :SubscriptionPhase, ::File.join(__dir__, "square/types/subscription_phase")
    autoload :CatalogSubscriptionPlanVariation, ::File.join(__dir__, "square/types/catalog_subscription_plan_variation")
    autoload :TaxCalculationPhase, ::File.join(__dir__, "square/types/tax_calculation_phase")
    autoload :TaxInclusionType, ::File.join(__dir__, "square/types/tax_inclusion_type")
    autoload :CatalogTax, ::File.join(__dir__, "square/types/catalog_tax")
    autoload :CatalogTimePeriod, ::File.join(__dir__, "square/types/catalog_time_period")
    autoload :CatalogObjectImage, ::File.join(__dir__, "square/types/catalog_object_image")
    autoload :CatalogObjectItemVariation, ::File.join(__dir__, "square/types/catalog_object_item_variation")
    autoload :CatalogObjectTax, ::File.join(__dir__, "square/types/catalog_object_tax")
    autoload :CatalogObjectDiscount, ::File.join(__dir__, "square/types/catalog_object_discount")
    autoload :CatalogObjectModifier, ::File.join(__dir__, "square/types/catalog_object_modifier")
    autoload :CatalogObjectPricingRule, ::File.join(__dir__, "square/types/catalog_object_pricing_rule")
    autoload :CatalogObjectProductSet, ::File.join(__dir__, "square/types/catalog_object_product_set")
    autoload :CatalogObjectTimePeriod, ::File.join(__dir__, "square/types/catalog_object_time_period")
    autoload :CatalogObjectMeasurementUnit, ::File.join(__dir__, "square/types/catalog_object_measurement_unit")
    autoload :CatalogObjectSubscriptionPlanVariation, ::File.join(__dir__, "square/types/catalog_object_subscription_plan_variation")
    autoload :CatalogObjectItemOptionValue, ::File.join(__dir__, "square/types/catalog_object_item_option_value")
    autoload :CatalogObjectCustomAttributeDefinition, ::File.join(__dir__, "square/types/catalog_object_custom_attribute_definition")
    autoload :CatalogObjectQuickAmountsSettings, ::File.join(__dir__, "square/types/catalog_object_quick_amounts_settings")
    autoload :CatalogObjectAvailabilityPeriod, ::File.join(__dir__, "square/types/catalog_object_availability_period")
    autoload :CatalogObjectSubscriptionPlan, ::File.join(__dir__, "square/types/catalog_object_subscription_plan")
    autoload :CatalogObjectItemOption, ::File.join(__dir__, "square/types/catalog_object_item_option")
    autoload :CatalogObjectModifierList, ::File.join(__dir__, "square/types/catalog_object_modifier_list")
    autoload :CatalogObjectItem, ::File.join(__dir__, "square/types/catalog_object_item")
    autoload :CatalogSubscriptionPlan, ::File.join(__dir__, "square/types/catalog_subscription_plan")
    autoload :CatalogObject, ::File.join(__dir__, "square/types/catalog_object")
    autoload :CatalogModifierList, ::File.join(__dir__, "square/types/catalog_modifier_list")
    autoload :CatalogItemOption, ::File.join(__dir__, "square/types/catalog_item_option")
    autoload :CatalogItem, ::File.join(__dir__, "square/types/catalog_item")
    autoload :IncludedResources, ::File.join(__dir__, "square/types/included_resources")
    autoload :BatchGetCatalogObjectsResponse, ::File.join(__dir__, "square/types/batch_get_catalog_objects_response")
    autoload :BatchRetrieveInventoryChangesSortField, ::File.join(__dir__, "square/types/batch_retrieve_inventory_changes_sort_field")
    autoload :SortOrder, ::File.join(__dir__, "square/types/sort_order")
    autoload :BatchRetrieveInventoryChangesSort, ::File.join(__dir__, "square/types/batch_retrieve_inventory_changes_sort")
    autoload :BatchRetrieveInventoryChangesRequest, ::File.join(__dir__, "square/types/batch_retrieve_inventory_changes_request")
    autoload :BatchGetInventoryChangesResponse, ::File.join(__dir__, "square/types/batch_get_inventory_changes_response")
    autoload :BatchGetInventoryCountsRequest, ::File.join(__dir__, "square/types/batch_get_inventory_counts_request")
    autoload :BatchGetInventoryCountsResponse, ::File.join(__dir__, "square/types/batch_get_inventory_counts_response")
    autoload :CardCoBrand, ::File.join(__dir__, "square/types/card_co_brand")
    autoload :CardIssuerAlert, ::File.join(__dir__, "square/types/card_issuer_alert")
    autoload :CardPrepaidType, ::File.join(__dir__, "square/types/card_prepaid_type")
    autoload :CardType, ::File.join(__dir__, "square/types/card_type")
    autoload :Card, ::File.join(__dir__, "square/types/card")
    autoload :FulfillmentDeliveryDetailsOrderFulfillmentDeliveryDetailsScheduleType, ::File.join(__dir__, "square/types/fulfillment_delivery_details_order_fulfillment_delivery_details_schedule_type")
    autoload :FulfillmentRecipient, ::File.join(__dir__, "square/types/fulfillment_recipient")
    autoload :FulfillmentDeliveryDetails, ::File.join(__dir__, "square/types/fulfillment_delivery_details")
    autoload :FulfillmentFulfillmentEntry, ::File.join(__dir__, "square/types/fulfillment_fulfillment_entry")
    autoload :FulfillmentFulfillmentLineItemApplication, ::File.join(__dir__, "square/types/fulfillment_fulfillment_line_item_application")
    autoload :FulfillmentInStoreDetails, ::File.join(__dir__, "square/types/fulfillment_in_store_details")
    autoload :FulfillmentPickupDetailsCurbsidePickupDetails, ::File.join(__dir__, "square/types/fulfillment_pickup_details_curbside_pickup_details")
    autoload :FulfillmentPickupDetailsScheduleType, ::File.join(__dir__, "square/types/fulfillment_pickup_details_schedule_type")
    autoload :FulfillmentPickupDetails, ::File.join(__dir__, "square/types/fulfillment_pickup_details")
    autoload :FulfillmentShipmentDetails, ::File.join(__dir__, "square/types/fulfillment_shipment_details")
    autoload :FulfillmentState, ::File.join(__dir__, "square/types/fulfillment_state")
    autoload :FulfillmentType, ::File.join(__dir__, "square/types/fulfillment_type")
    autoload :Fulfillment, ::File.join(__dir__, "square/types/fulfillment")
    autoload :OrderLineItemAppliedDiscount, ::File.join(__dir__, "square/types/order_line_item_applied_discount")
    autoload :OrderLineItemAppliedServiceCharge, ::File.join(__dir__, "square/types/order_line_item_applied_service_charge")
    autoload :OrderLineItemAppliedTax, ::File.join(__dir__, "square/types/order_line_item_applied_tax")
    autoload :OrderLineItemItemType, ::File.join(__dir__, "square/types/order_line_item_item_type")
    autoload :OrderLineItemModifier, ::File.join(__dir__, "square/types/order_line_item_modifier")
    autoload :OrderLineItemPricingBlocklistsBlockedDiscount, ::File.join(__dir__, "square/types/order_line_item_pricing_blocklists_blocked_discount")
    autoload :OrderLineItemPricingBlocklistsBlockedServiceCharge, ::File.join(__dir__, "square/types/order_line_item_pricing_blocklists_blocked_service_charge")
    autoload :OrderLineItemPricingBlocklistsBlockedTax, ::File.join(__dir__, "square/types/order_line_item_pricing_blocklists_blocked_tax")
    autoload :OrderLineItemPricingBlocklists, ::File.join(__dir__, "square/types/order_line_item_pricing_blocklists")
    autoload :OrderQuantityUnit, ::File.join(__dir__, "square/types/order_quantity_unit")
    autoload :OrderLineItem, ::File.join(__dir__, "square/types/order_line_item")
    autoload :OrderLineItemDiscountScope, ::File.join(__dir__, "square/types/order_line_item_discount_scope")
    autoload :OrderLineItemDiscountType, ::File.join(__dir__, "square/types/order_line_item_discount_type")
    autoload :OrderLineItemDiscount, ::File.join(__dir__, "square/types/order_line_item_discount")
    autoload :OrderLineItemTaxScope, ::File.join(__dir__, "square/types/order_line_item_tax_scope")
    autoload :OrderLineItemTaxType, ::File.join(__dir__, "square/types/order_line_item_tax_type")
    autoload :OrderLineItemTax, ::File.join(__dir__, "square/types/order_line_item_tax")
    autoload :OrderMoneyAmounts, ::File.join(__dir__, "square/types/order_money_amounts")
    autoload :OrderPricingOptions, ::File.join(__dir__, "square/types/order_pricing_options")
    autoload :OrderReturnDiscount, ::File.join(__dir__, "square/types/order_return_discount")
    autoload :OrderReturnLineItemModifier, ::File.join(__dir__, "square/types/order_return_line_item_modifier")
    autoload :OrderReturnLineItem, ::File.join(__dir__, "square/types/order_return_line_item")
    autoload :OrderServiceChargeCalculationPhase, ::File.join(__dir__, "square/types/order_service_charge_calculation_phase")
    autoload :OrderServiceChargeScope, ::File.join(__dir__, "square/types/order_service_charge_scope")
    autoload :OrderServiceChargeTreatmentType, ::File.join(__dir__, "square/types/order_service_charge_treatment_type")
    autoload :OrderServiceChargeType, ::File.join(__dir__, "square/types/order_service_charge_type")
    autoload :OrderReturnServiceCharge, ::File.join(__dir__, "square/types/order_return_service_charge")
    autoload :OrderReturnTax, ::File.join(__dir__, "square/types/order_return_tax")
    autoload :OrderReturnTip, ::File.join(__dir__, "square/types/order_return_tip")
    autoload :OrderRoundingAdjustment, ::File.join(__dir__, "square/types/order_rounding_adjustment")
    autoload :OrderReturn, ::File.join(__dir__, "square/types/order_return")
    autoload :OrderReward, ::File.join(__dir__, "square/types/order_reward")
    autoload :OrderServiceCharge, ::File.join(__dir__, "square/types/order_service_charge")
    autoload :OrderSource, ::File.join(__dir__, "square/types/order_source")
    autoload :OrderState, ::File.join(__dir__, "square/types/order_state")
    autoload :RefundStatus, ::File.join(__dir__, "square/types/refund_status")
    autoload :Refund, ::File.join(__dir__, "square/types/refund")
    autoload :TenderBankAccountDetailsStatus, ::File.join(__dir__, "square/types/tender_bank_account_details_status")
    autoload :TenderBankAccountDetails, ::File.join(__dir__, "square/types/tender_bank_account_details")
    autoload :TenderBuyNowPayLaterDetailsBrand, ::File.join(__dir__, "square/types/tender_buy_now_pay_later_details_brand")
    autoload :TenderBuyNowPayLaterDetailsStatus, ::File.join(__dir__, "square/types/tender_buy_now_pay_later_details_status")
    autoload :TenderBuyNowPayLaterDetails, ::File.join(__dir__, "square/types/tender_buy_now_pay_later_details")
    autoload :TenderCardDetailsEntryMethod, ::File.join(__dir__, "square/types/tender_card_details_entry_method")
    autoload :TenderCardDetailsStatus, ::File.join(__dir__, "square/types/tender_card_details_status")
    autoload :TenderCardDetails, ::File.join(__dir__, "square/types/tender_card_details")
    autoload :TenderCashDetails, ::File.join(__dir__, "square/types/tender_cash_details")
    autoload :TenderSquareAccountDetailsStatus, ::File.join(__dir__, "square/types/tender_square_account_details_status")
    autoload :TenderSquareAccountDetails, ::File.join(__dir__, "square/types/tender_square_account_details")
    autoload :TenderType, ::File.join(__dir__, "square/types/tender_type")
    autoload :Tender, ::File.join(__dir__, "square/types/tender")
    autoload :Order, ::File.join(__dir__, "square/types/order")
    autoload :BatchGetOrdersResponse, ::File.join(__dir__, "square/types/batch_get_orders_response")
    autoload :CatalogIdMapping, ::File.join(__dir__, "square/types/catalog_id_mapping")
    autoload :BatchUpsertCatalogObjectsResponse, ::File.join(__dir__, "square/types/batch_upsert_catalog_objects_response")
    autoload :BookingBookingSource, ::File.join(__dir__, "square/types/booking_booking_source")
    autoload :BookingCreatorDetailsCreatorType, ::File.join(__dir__, "square/types/booking_creator_details_creator_type")
    autoload :BookingCreatorDetails, ::File.join(__dir__, "square/types/booking_creator_details")
    autoload :BookingStatus, ::File.join(__dir__, "square/types/booking_status")
    autoload :BusinessAppointmentSettingsBookingLocationType, ::File.join(__dir__, "square/types/business_appointment_settings_booking_location_type")
    autoload :Booking, ::File.join(__dir__, "square/types/booking")
    autoload :BookingCreatedEventObject, ::File.join(__dir__, "square/types/booking_created_event_object")
    autoload :BookingCreatedEventData, ::File.join(__dir__, "square/types/booking_created_event_data")
    autoload :BookingCreatedEvent, ::File.join(__dir__, "square/types/booking_created_event")
    autoload :CustomAttributeDefinitionVisibility, ::File.join(__dir__, "square/types/custom_attribute_definition_visibility")
    autoload :CustomAttributeDefinition, ::File.join(__dir__, "square/types/custom_attribute_definition")
    autoload :CustomAttributeDefinitionEventDataObject, ::File.join(__dir__, "square/types/custom_attribute_definition_event_data_object")
    autoload :CustomAttributeDefinitionEventData, ::File.join(__dir__, "square/types/custom_attribute_definition_event_data")
    autoload :BookingCustomAttributeDefinitionOwnedCreatedEvent, ::File.join(__dir__, "square/types/booking_custom_attribute_definition_owned_created_event")
    autoload :BookingCustomAttributeDefinitionOwnedDeletedEvent, ::File.join(__dir__, "square/types/booking_custom_attribute_definition_owned_deleted_event")
    autoload :BookingCustomAttributeDefinitionOwnedUpdatedEvent, ::File.join(__dir__, "square/types/booking_custom_attribute_definition_owned_updated_event")
    autoload :BookingCustomAttributeDefinitionVisibleCreatedEvent, ::File.join(__dir__, "square/types/booking_custom_attribute_definition_visible_created_event")
    autoload :BookingCustomAttributeDefinitionVisibleDeletedEvent, ::File.join(__dir__, "square/types/booking_custom_attribute_definition_visible_deleted_event")
    autoload :BookingCustomAttributeDefinitionVisibleUpdatedEvent, ::File.join(__dir__, "square/types/booking_custom_attribute_definition_visible_updated_event")
    autoload :BookingCustomAttributeDeleteRequest, ::File.join(__dir__, "square/types/booking_custom_attribute_delete_request")
    autoload :BookingCustomAttributeDeleteResponse, ::File.join(__dir__, "square/types/booking_custom_attribute_delete_response")
    autoload :CustomAttribute, ::File.join(__dir__, "square/types/custom_attribute")
    autoload :CustomAttributeEventDataObject, ::File.join(__dir__, "square/types/custom_attribute_event_data_object")
    autoload :CustomAttributeEventData, ::File.join(__dir__, "square/types/custom_attribute_event_data")
    autoload :BookingCustomAttributeOwnedDeletedEvent, ::File.join(__dir__, "square/types/booking_custom_attribute_owned_deleted_event")
    autoload :BookingCustomAttributeOwnedUpdatedEvent, ::File.join(__dir__, "square/types/booking_custom_attribute_owned_updated_event")
    autoload :BookingCustomAttributeUpsertRequest, ::File.join(__dir__, "square/types/booking_custom_attribute_upsert_request")
    autoload :BookingCustomAttributeUpsertResponse, ::File.join(__dir__, "square/types/booking_custom_attribute_upsert_response")
    autoload :BookingCustomAttributeVisibleDeletedEvent, ::File.join(__dir__, "square/types/booking_custom_attribute_visible_deleted_event")
    autoload :BookingCustomAttributeVisibleUpdatedEvent, ::File.join(__dir__, "square/types/booking_custom_attribute_visible_updated_event")
    autoload :BookingUpdatedEventObject, ::File.join(__dir__, "square/types/booking_updated_event_object")
    autoload :BookingUpdatedEventData, ::File.join(__dir__, "square/types/booking_updated_event_data")
    autoload :BookingUpdatedEvent, ::File.join(__dir__, "square/types/booking_updated_event")
    autoload :Break, ::File.join(__dir__, "square/types/break_")
    autoload :BreakType, ::File.join(__dir__, "square/types/break_type")
    autoload :CustomerTaxIds, ::File.join(__dir__, "square/types/customer_tax_ids")
    autoload :BulkCreateCustomerData, ::File.join(__dir__, "square/types/bulk_create_customer_data")
    autoload :CustomerCreationSource, ::File.join(__dir__, "square/types/customer_creation_source")
    autoload :CustomerPreferences, ::File.join(__dir__, "square/types/customer_preferences")
    autoload :Customer, ::File.join(__dir__, "square/types/customer")
    autoload :CreateCustomerResponse, ::File.join(__dir__, "square/types/create_customer_response")
    autoload :BulkCreateCustomersResponse, ::File.join(__dir__, "square/types/bulk_create_customers_response")
    autoload :JobAssignmentPayType, ::File.join(__dir__, "square/types/job_assignment_pay_type")
    autoload :JobAssignment, ::File.join(__dir__, "square/types/job_assignment")
    autoload :TeamMemberAssignedLocationsAssignmentType, ::File.join(__dir__, "square/types/team_member_assigned_locations_assignment_type")
    autoload :TeamMemberAssignedLocations, ::File.join(__dir__, "square/types/team_member_assigned_locations")
    autoload :TeamMemberStatus, ::File.join(__dir__, "square/types/team_member_status")
    autoload :WageSetting, ::File.join(__dir__, "square/types/wage_setting")
    autoload :TeamMember, ::File.join(__dir__, "square/types/team_member")
    autoload :CreateTeamMemberResponse, ::File.join(__dir__, "square/types/create_team_member_response")
    autoload :BatchCreateTeamMembersResponse, ::File.join(__dir__, "square/types/batch_create_team_members_response")
    autoload :VendorContact, ::File.join(__dir__, "square/types/vendor_contact")
    autoload :VendorStatus, ::File.join(__dir__, "square/types/vendor_status")
    autoload :Vendor, ::File.join(__dir__, "square/types/vendor")
    autoload :CreateVendorResponse, ::File.join(__dir__, "square/types/create_vendor_response")
    autoload :BatchCreateVendorsResponse, ::File.join(__dir__, "square/types/batch_create_vendors_response")
    autoload :BulkDeleteBookingCustomAttributesResponse, ::File.join(__dir__, "square/types/bulk_delete_booking_custom_attributes_response")
    autoload :DeleteCustomerResponse, ::File.join(__dir__, "square/types/delete_customer_response")
    autoload :BulkDeleteCustomersResponse, ::File.join(__dir__, "square/types/bulk_delete_customers_response")
    autoload :BulkDeleteLocationCustomAttributesRequestLocationCustomAttributeDeleteRequest, ::File.join(__dir__, "square/types/bulk_delete_location_custom_attributes_request_location_custom_attribute_delete_request")
    autoload :BulkDeleteLocationCustomAttributesResponseLocationCustomAttributeDeleteResponse, ::File.join(__dir__, "square/types/bulk_delete_location_custom_attributes_response_location_custom_attribute_delete_response")
    autoload :BulkDeleteLocationCustomAttributesResponse, ::File.join(__dir__, "square/types/bulk_delete_location_custom_attributes_response")
    autoload :BulkDeleteMerchantCustomAttributesRequestMerchantCustomAttributeDeleteRequest, ::File.join(__dir__, "square/types/bulk_delete_merchant_custom_attributes_request_merchant_custom_attribute_delete_request")
    autoload :BulkDeleteMerchantCustomAttributesResponseMerchantCustomAttributeDeleteResponse, ::File.join(__dir__, "square/types/bulk_delete_merchant_custom_attributes_response_merchant_custom_attribute_delete_response")
    autoload :BulkDeleteMerchantCustomAttributesResponse, ::File.join(__dir__, "square/types/bulk_delete_merchant_custom_attributes_response")
    autoload :BulkDeleteOrderCustomAttributesRequestDeleteCustomAttribute, ::File.join(__dir__, "square/types/bulk_delete_order_custom_attributes_request_delete_custom_attribute")
    autoload :DeleteOrderCustomAttributeResponse, ::File.join(__dir__, "square/types/delete_order_custom_attribute_response")
    autoload :BulkDeleteOrderCustomAttributesResponse, ::File.join(__dir__, "square/types/bulk_delete_order_custom_attributes_response")
    autoload :BulkPublishScheduledShiftsData, ::File.join(__dir__, "square/types/bulk_publish_scheduled_shifts_data")
    autoload :ScheduledShiftDetails, ::File.join(__dir__, "square/types/scheduled_shift_details")
    autoload :ScheduledShift, ::File.join(__dir__, "square/types/scheduled_shift")
    autoload :PublishScheduledShiftResponse, ::File.join(__dir__, "square/types/publish_scheduled_shift_response")
    autoload :BulkPublishScheduledShiftsResponse, ::File.join(__dir__, "square/types/bulk_publish_scheduled_shifts_response")
    autoload :GetBookingResponse, ::File.join(__dir__, "square/types/get_booking_response")
    autoload :BulkRetrieveBookingsResponse, ::File.join(__dir__, "square/types/bulk_retrieve_bookings_response")
    autoload :BulkRetrieveChannelsRequestConstants, ::File.join(__dir__, "square/types/bulk_retrieve_channels_request_constants")
    autoload :ChannelStatus, ::File.join(__dir__, "square/types/channel_status")
    autoload :ReferenceType, ::File.join(__dir__, "square/types/reference_type")
    autoload :Reference, ::File.join(__dir__, "square/types/reference")
    autoload :Channel, ::File.join(__dir__, "square/types/channel")
    autoload :RetrieveChannelResponse, ::File.join(__dir__, "square/types/retrieve_channel_response")
    autoload :BulkRetrieveChannelsResponse, ::File.join(__dir__, "square/types/bulk_retrieve_channels_response")
    autoload :GetCustomerResponse, ::File.join(__dir__, "square/types/get_customer_response")
    autoload :BulkRetrieveCustomersResponse, ::File.join(__dir__, "square/types/bulk_retrieve_customers_response")
    autoload :TeamMemberBookingProfile, ::File.join(__dir__, "square/types/team_member_booking_profile")
    autoload :GetTeamMemberBookingProfileResponse, ::File.join(__dir__, "square/types/get_team_member_booking_profile_response")
    autoload :BulkRetrieveTeamMemberBookingProfilesResponse, ::File.join(__dir__, "square/types/bulk_retrieve_team_member_booking_profiles_response")
    autoload :GetVendorResponse, ::File.join(__dir__, "square/types/get_vendor_response")
    autoload :BatchGetVendorsResponse, ::File.join(__dir__, "square/types/batch_get_vendors_response")
    autoload :BulkSwapPlanResponse, ::File.join(__dir__, "square/types/bulk_swap_plan_response")
    autoload :BulkUpdateCustomerData, ::File.join(__dir__, "square/types/bulk_update_customer_data")
    autoload :UpdateCustomerResponse, ::File.join(__dir__, "square/types/update_customer_response")
    autoload :BulkUpdateCustomersResponse, ::File.join(__dir__, "square/types/bulk_update_customers_response")
    autoload :UpdateTeamMemberResponse, ::File.join(__dir__, "square/types/update_team_member_response")
    autoload :BatchUpdateTeamMembersResponse, ::File.join(__dir__, "square/types/batch_update_team_members_response")
    autoload :UpdateVendorResponse, ::File.join(__dir__, "square/types/update_vendor_response")
    autoload :BatchUpdateVendorsResponse, ::File.join(__dir__, "square/types/batch_update_vendors_response")
    autoload :BulkUpsertBookingCustomAttributesResponse, ::File.join(__dir__, "square/types/bulk_upsert_booking_custom_attributes_response")
    autoload :BatchUpsertCustomerCustomAttributesRequestCustomerCustomAttributeUpsertRequest, ::File.join(__dir__, "square/types/batch_upsert_customer_custom_attributes_request_customer_custom_attribute_upsert_request")
    autoload :BatchUpsertCustomerCustomAttributesResponseCustomerCustomAttributeUpsertResponse, ::File.join(__dir__, "square/types/batch_upsert_customer_custom_attributes_response_customer_custom_attribute_upsert_response")
    autoload :BatchUpsertCustomerCustomAttributesResponse, ::File.join(__dir__, "square/types/batch_upsert_customer_custom_attributes_response")
    autoload :BulkUpsertLocationCustomAttributesRequestLocationCustomAttributeUpsertRequest, ::File.join(__dir__, "square/types/bulk_upsert_location_custom_attributes_request_location_custom_attribute_upsert_request")
    autoload :BulkUpsertLocationCustomAttributesResponseLocationCustomAttributeUpsertResponse, ::File.join(__dir__, "square/types/bulk_upsert_location_custom_attributes_response_location_custom_attribute_upsert_response")
    autoload :BulkUpsertLocationCustomAttributesResponse, ::File.join(__dir__, "square/types/bulk_upsert_location_custom_attributes_response")
    autoload :BulkUpsertMerchantCustomAttributesRequestMerchantCustomAttributeUpsertRequest, ::File.join(__dir__, "square/types/bulk_upsert_merchant_custom_attributes_request_merchant_custom_attribute_upsert_request")
    autoload :BulkUpsertMerchantCustomAttributesResponseMerchantCustomAttributeUpsertResponse, ::File.join(__dir__, "square/types/bulk_upsert_merchant_custom_attributes_response_merchant_custom_attribute_upsert_response")
    autoload :BulkUpsertMerchantCustomAttributesResponse, ::File.join(__dir__, "square/types/bulk_upsert_merchant_custom_attributes_response")
    autoload :BulkUpsertOrderCustomAttributesRequestUpsertCustomAttribute, ::File.join(__dir__, "square/types/bulk_upsert_order_custom_attributes_request_upsert_custom_attribute")
    autoload :UpsertOrderCustomAttributeResponse, ::File.join(__dir__, "square/types/upsert_order_custom_attribute_response")
    autoload :BulkUpsertOrderCustomAttributesResponse, ::File.join(__dir__, "square/types/bulk_upsert_order_custom_attributes_response")
    autoload :BusinessAppointmentSettingsAlignmentTime, ::File.join(__dir__, "square/types/business_appointment_settings_alignment_time")
    autoload :BusinessAppointmentSettingsCancellationPolicy, ::File.join(__dir__, "square/types/business_appointment_settings_cancellation_policy")
    autoload :BusinessAppointmentSettingsMaxAppointmentsPerDayLimitType, ::File.join(__dir__, "square/types/business_appointment_settings_max_appointments_per_day_limit_type")
    autoload :BusinessAppointmentSettings, ::File.join(__dir__, "square/types/business_appointment_settings")
    autoload :BusinessBookingProfileBookingPolicy, ::File.join(__dir__, "square/types/business_booking_profile_booking_policy")
    autoload :BusinessBookingProfileCustomerTimezoneChoice, ::File.join(__dir__, "square/types/business_booking_profile_customer_timezone_choice")
    autoload :BusinessBookingProfile, ::File.join(__dir__, "square/types/business_booking_profile")
    autoload :BusinessHoursPeriod, ::File.join(__dir__, "square/types/business_hours_period")
    autoload :BusinessHours, ::File.join(__dir__, "square/types/business_hours")
    autoload :ClearpayDetails, ::File.join(__dir__, "square/types/clearpay_details")
    autoload :BuyNowPayLaterDetails, ::File.join(__dir__, "square/types/buy_now_pay_later_details")
    autoload :CalculateLoyaltyPointsResponse, ::File.join(__dir__, "square/types/calculate_loyalty_points_response")
    autoload :CalculateOrderResponse, ::File.join(__dir__, "square/types/calculate_order_response")
    autoload :CancelBookingResponse, ::File.join(__dir__, "square/types/cancel_booking_response")
    autoload :InvoiceAcceptedPaymentMethods, ::File.join(__dir__, "square/types/invoice_accepted_payment_methods")
    autoload :InvoiceAttachment, ::File.join(__dir__, "square/types/invoice_attachment")
    autoload :InvoiceAutomaticPaymentSource, ::File.join(__dir__, "square/types/invoice_automatic_payment_source")
    autoload :InvoiceCustomFieldPlacement, ::File.join(__dir__, "square/types/invoice_custom_field_placement")
    autoload :InvoiceCustomField, ::File.join(__dir__, "square/types/invoice_custom_field")
    autoload :InvoiceDeliveryMethod, ::File.join(__dir__, "square/types/invoice_delivery_method")
    autoload :InvoicePaymentReminderStatus, ::File.join(__dir__, "square/types/invoice_payment_reminder_status")
    autoload :InvoicePaymentReminder, ::File.join(__dir__, "square/types/invoice_payment_reminder")
    autoload :InvoiceRequestMethod, ::File.join(__dir__, "square/types/invoice_request_method")
    autoload :InvoiceRequestType, ::File.join(__dir__, "square/types/invoice_request_type")
    autoload :InvoicePaymentRequest, ::File.join(__dir__, "square/types/invoice_payment_request")
    autoload :InvoiceRecipientTaxIds, ::File.join(__dir__, "square/types/invoice_recipient_tax_ids")
    autoload :InvoiceRecipient, ::File.join(__dir__, "square/types/invoice_recipient")
    autoload :InvoiceStatus, ::File.join(__dir__, "square/types/invoice_status")
    autoload :Invoice, ::File.join(__dir__, "square/types/invoice")
    autoload :CancelInvoiceResponse, ::File.join(__dir__, "square/types/cancel_invoice_response")
    autoload :LoyaltyPromotionAvailableTimeData, ::File.join(__dir__, "square/types/loyalty_promotion_available_time_data")
    autoload :LoyaltyPromotionIncentivePointsAdditionData, ::File.join(__dir__, "square/types/loyalty_promotion_incentive_points_addition_data")
    autoload :LoyaltyPromotionIncentivePointsMultiplierData, ::File.join(__dir__, "square/types/loyalty_promotion_incentive_points_multiplier_data")
    autoload :LoyaltyPromotionIncentiveType, ::File.join(__dir__, "square/types/loyalty_promotion_incentive_type")
    autoload :LoyaltyPromotionIncentive, ::File.join(__dir__, "square/types/loyalty_promotion_incentive")
    autoload :LoyaltyPromotionStatus, ::File.join(__dir__, "square/types/loyalty_promotion_status")
    autoload :LoyaltyPromotionTriggerLimitInterval, ::File.join(__dir__, "square/types/loyalty_promotion_trigger_limit_interval")
    autoload :LoyaltyPromotionTriggerLimit, ::File.join(__dir__, "square/types/loyalty_promotion_trigger_limit")
    autoload :LoyaltyPromotion, ::File.join(__dir__, "square/types/loyalty_promotion")
    autoload :CancelLoyaltyPromotionResponse, ::File.join(__dir__, "square/types/cancel_loyalty_promotion_response")
    autoload :CancelPaymentByIdempotencyKeyResponse, ::File.join(__dir__, "square/types/cancel_payment_by_idempotency_key_response")
    autoload :CardPaymentTimeline, ::File.join(__dir__, "square/types/card_payment_timeline")
    autoload :CardSurchargeDetails, ::File.join(__dir__, "square/types/card_surcharge_details")
    autoload :DeviceDetails, ::File.join(__dir__, "square/types/device_details")
    autoload :CardPaymentDetails, ::File.join(__dir__, "square/types/card_payment_details")
    autoload :CashAppDetails, ::File.join(__dir__, "square/types/cash_app_details")
    autoload :CashPaymentDetails, ::File.join(__dir__, "square/types/cash_payment_details")
    autoload :LightningDetails, ::File.join(__dir__, "square/types/lightning_details")
    autoload :DigitalWalletDetails, ::File.join(__dir__, "square/types/digital_wallet_details")
    autoload :FelicaDetailsFelicaBrand, ::File.join(__dir__, "square/types/felica_details_felica_brand")
    autoload :FelicaDetails, ::File.join(__dir__, "square/types/felica_details")
    autoload :ElectronicMoneyDetails, ::File.join(__dir__, "square/types/electronic_money_details")
    autoload :ExternalPaymentDetails, ::File.join(__dir__, "square/types/external_payment_details")
    autoload :OfflinePaymentDetails, ::File.join(__dir__, "square/types/offline_payment_details")
    autoload :ProcessingFee, ::File.join(__dir__, "square/types/processing_fee")
    autoload :RiskEvaluationRiskLevel, ::File.join(__dir__, "square/types/risk_evaluation_risk_level")
    autoload :RiskEvaluation, ::File.join(__dir__, "square/types/risk_evaluation")
    autoload :SquareAccountDetails, ::File.join(__dir__, "square/types/square_account_details")
    autoload :Payment, ::File.join(__dir__, "square/types/payment")
    autoload :CancelPaymentResponse, ::File.join(__dir__, "square/types/cancel_payment_response")
    autoload :Phase, ::File.join(__dir__, "square/types/phase")
    autoload :SubscriptionActionType, ::File.join(__dir__, "square/types/subscription_action_type")
    autoload :SubscriptionAction, ::File.join(__dir__, "square/types/subscription_action")
    autoload :SubscriptionSource, ::File.join(__dir__, "square/types/subscription_source")
    autoload :SubscriptionStatus, ::File.join(__dir__, "square/types/subscription_status")
    autoload :Subscription, ::File.join(__dir__, "square/types/subscription")
    autoload :CancelSubscriptionResponse, ::File.join(__dir__, "square/types/cancel_subscription_response")
    autoload :CollectedData, ::File.join(__dir__, "square/types/collected_data")
    autoload :ConfirmationDecision, ::File.join(__dir__, "square/types/confirmation_decision")
    autoload :ConfirmationOptions, ::File.join(__dir__, "square/types/confirmation_options")
    autoload :DataCollectionOptionsInputType, ::File.join(__dir__, "square/types/data_collection_options_input_type")
    autoload :DataCollectionOptions, ::File.join(__dir__, "square/types/data_collection_options")
    autoload :DeviceMetadata, ::File.join(__dir__, "square/types/device_metadata")
    autoload :QrCodeOptions, ::File.join(__dir__, "square/types/qr_code_options")
    autoload :ReceiptOptions, ::File.join(__dir__, "square/types/receipt_options")
    autoload :SaveCardOptions, ::File.join(__dir__, "square/types/save_card_options")
    autoload :SelectOption, ::File.join(__dir__, "square/types/select_option")
    autoload :SelectOptions, ::File.join(__dir__, "square/types/select_options")
    autoload :SignatureImage, ::File.join(__dir__, "square/types/signature_image")
    autoload :SignatureOptions, ::File.join(__dir__, "square/types/signature_options")
    autoload :TerminalActionActionType, ::File.join(__dir__, "square/types/terminal_action_action_type")
    autoload :TerminalAction, ::File.join(__dir__, "square/types/terminal_action")
    autoload :CancelTerminalActionResponse, ::File.join(__dir__, "square/types/cancel_terminal_action_response")
    autoload :CheckoutOptionsPaymentType, ::File.join(__dir__, "square/types/checkout_options_payment_type")
    autoload :TipSettings, ::File.join(__dir__, "square/types/tip_settings")
    autoload :DeviceCheckoutOptions, ::File.join(__dir__, "square/types/device_checkout_options")
    autoload :PaymentOptionsDelayAction, ::File.join(__dir__, "square/types/payment_options_delay_action")
    autoload :PaymentOptions, ::File.join(__dir__, "square/types/payment_options")
    autoload :TerminalCheckout, ::File.join(__dir__, "square/types/terminal_checkout")
    autoload :CancelTerminalCheckoutResponse, ::File.join(__dir__, "square/types/cancel_terminal_checkout_response")
    autoload :TerminalRefund, ::File.join(__dir__, "square/types/terminal_refund")
    autoload :CancelTerminalRefundResponse, ::File.join(__dir__, "square/types/cancel_terminal_refund_response")
    autoload :TransferOrderLine, ::File.join(__dir__, "square/types/transfer_order_line")
    autoload :TransferOrderStatus, ::File.join(__dir__, "square/types/transfer_order_status")
    autoload :TransferOrder, ::File.join(__dir__, "square/types/transfer_order")
    autoload :CancelTransferOrderResponse, ::File.join(__dir__, "square/types/cancel_transfer_order_response")
    autoload :CardAutomaticallyUpdatedEventObject, ::File.join(__dir__, "square/types/card_automatically_updated_event_object")
    autoload :CardAutomaticallyUpdatedEventData, ::File.join(__dir__, "square/types/card_automatically_updated_event_data")
    autoload :CardAutomaticallyUpdatedEvent, ::File.join(__dir__, "square/types/card_automatically_updated_event")
    autoload :CardCreatedEventObject, ::File.join(__dir__, "square/types/card_created_event_object")
    autoload :CardCreatedEventData, ::File.join(__dir__, "square/types/card_created_event_data")
    autoload :CardCreatedEvent, ::File.join(__dir__, "square/types/card_created_event")
    autoload :CardDisabledEventObject, ::File.join(__dir__, "square/types/card_disabled_event_object")
    autoload :CardDisabledEventData, ::File.join(__dir__, "square/types/card_disabled_event_data")
    autoload :CardDisabledEvent, ::File.join(__dir__, "square/types/card_disabled_event")
    autoload :CardForgottenEventCard, ::File.join(__dir__, "square/types/card_forgotten_event_card")
    autoload :CardForgottenEventObject, ::File.join(__dir__, "square/types/card_forgotten_event_object")
    autoload :CardForgottenEventData, ::File.join(__dir__, "square/types/card_forgotten_event_data")
    autoload :CardForgottenEvent, ::File.join(__dir__, "square/types/card_forgotten_event")
    autoload :CardUpdatedEventObject, ::File.join(__dir__, "square/types/card_updated_event_object")
    autoload :CardUpdatedEventData, ::File.join(__dir__, "square/types/card_updated_event_data")
    autoload :CardUpdatedEvent, ::File.join(__dir__, "square/types/card_updated_event")
    autoload :CashDrawerDevice, ::File.join(__dir__, "square/types/cash_drawer_device")
    autoload :CashDrawerEventType, ::File.join(__dir__, "square/types/cash_drawer_event_type")
    autoload :CashDrawerShiftState, ::File.join(__dir__, "square/types/cash_drawer_shift_state")
    autoload :CashDrawerShift, ::File.join(__dir__, "square/types/cash_drawer_shift")
    autoload :CashDrawerShiftEvent, ::File.join(__dir__, "square/types/cash_drawer_shift_event")
    autoload :CashDrawerShiftSummary, ::File.join(__dir__, "square/types/cash_drawer_shift_summary")
    autoload :CatalogInfoResponseLimits, ::File.join(__dir__, "square/types/catalog_info_response_limits")
    autoload :StandardUnitDescription, ::File.join(__dir__, "square/types/standard_unit_description")
    autoload :StandardUnitDescriptionGroup, ::File.join(__dir__, "square/types/standard_unit_description_group")
    autoload :CatalogInfoResponse, ::File.join(__dir__, "square/types/catalog_info_response")
    autoload :CatalogObjectBatch, ::File.join(__dir__, "square/types/catalog_object_batch")
    autoload :CatalogObjectReference, ::File.join(__dir__, "square/types/catalog_object_reference")
    autoload :CatalogQueryExact, ::File.join(__dir__, "square/types/catalog_query_exact")
    autoload :CatalogQueryItemVariationsForItemOptionValues, ::File.join(__dir__, "square/types/catalog_query_item_variations_for_item_option_values")
    autoload :CatalogQueryItemsForItemOptions, ::File.join(__dir__, "square/types/catalog_query_items_for_item_options")
    autoload :CatalogQueryItemsForModifierList, ::File.join(__dir__, "square/types/catalog_query_items_for_modifier_list")
    autoload :CatalogQueryItemsForTax, ::File.join(__dir__, "square/types/catalog_query_items_for_tax")
    autoload :CatalogQueryModifiersForChildList, ::File.join(__dir__, "square/types/catalog_query_modifiers_for_child_list")
    autoload :CatalogQueryPrefix, ::File.join(__dir__, "square/types/catalog_query_prefix")
    autoload :CatalogQueryRange, ::File.join(__dir__, "square/types/catalog_query_range")
    autoload :CatalogQuerySet, ::File.join(__dir__, "square/types/catalog_query_set")
    autoload :CatalogQuerySortedAttribute, ::File.join(__dir__, "square/types/catalog_query_sorted_attribute")
    autoload :CatalogQueryText, ::File.join(__dir__, "square/types/catalog_query_text")
    autoload :CatalogQuery, ::File.join(__dir__, "square/types/catalog_query")
    autoload :CatalogVersionUpdatedEventCatalogVersion, ::File.join(__dir__, "square/types/catalog_version_updated_event_catalog_version")
    autoload :CatalogVersionUpdatedEventObject, ::File.join(__dir__, "square/types/catalog_version_updated_event_object")
    autoload :CatalogVersionUpdatedEventData, ::File.join(__dir__, "square/types/catalog_version_updated_event_data")
    autoload :CatalogVersionUpdatedEvent, ::File.join(__dir__, "square/types/catalog_version_updated_event")
    autoload :ChangeBillingAnchorDateResponse, ::File.join(__dir__, "square/types/change_billing_anchor_date_response")
    autoload :ChangeTiming, ::File.join(__dir__, "square/types/change_timing")
    autoload :ChargeRequestAdditionalRecipient, ::File.join(__dir__, "square/types/charge_request_additional_recipient")
    autoload :Checkout, ::File.join(__dir__, "square/types/checkout")
    autoload :CheckoutLocationSettingsBrandingButtonShape, ::File.join(__dir__, "square/types/checkout_location_settings_branding_button_shape")
    autoload :CheckoutLocationSettingsBrandingHeaderType, ::File.join(__dir__, "square/types/checkout_location_settings_branding_header_type")
    autoload :CheckoutLocationSettingsBranding, ::File.join(__dir__, "square/types/checkout_location_settings_branding")
    autoload :CheckoutLocationSettingsCoupons, ::File.join(__dir__, "square/types/checkout_location_settings_coupons")
    autoload :CheckoutLocationSettingsPolicy, ::File.join(__dir__, "square/types/checkout_location_settings_policy")
    autoload :CheckoutLocationSettingsTipping, ::File.join(__dir__, "square/types/checkout_location_settings_tipping")
    autoload :CheckoutLocationSettings, ::File.join(__dir__, "square/types/checkout_location_settings")
    autoload :CheckoutMerchantSettingsPaymentMethodsAfterpayClearpayEligibilityRange, ::File.join(__dir__, "square/types/checkout_merchant_settings_payment_methods_afterpay_clearpay_eligibility_range")
    autoload :CheckoutMerchantSettingsPaymentMethodsAfterpayClearpay, ::File.join(__dir__, "square/types/checkout_merchant_settings_payment_methods_afterpay_clearpay")
    autoload :CheckoutMerchantSettingsPaymentMethodsPaymentMethod, ::File.join(__dir__, "square/types/checkout_merchant_settings_payment_methods_payment_method")
    autoload :CheckoutMerchantSettingsPaymentMethods, ::File.join(__dir__, "square/types/checkout_merchant_settings_payment_methods")
    autoload :CheckoutMerchantSettings, ::File.join(__dir__, "square/types/checkout_merchant_settings")
    autoload :CustomField, ::File.join(__dir__, "square/types/custom_field")
    autoload :ShippingFee, ::File.join(__dir__, "square/types/shipping_fee")
    autoload :CheckoutOptions, ::File.join(__dir__, "square/types/checkout_options")
    autoload :CloneOrderResponse, ::File.join(__dir__, "square/types/clone_order_response")
    autoload :CompletePaymentResponse, ::File.join(__dir__, "square/types/complete_payment_response")
    autoload :ComponentComponentType, ::File.join(__dir__, "square/types/component_component_type")
    autoload :DeviceComponentDetailsApplicationDetails, ::File.join(__dir__, "square/types/device_component_details_application_details")
    autoload :DeviceComponentDetailsExternalPower, ::File.join(__dir__, "square/types/device_component_details_external_power")
    autoload :DeviceComponentDetailsBatteryDetails, ::File.join(__dir__, "square/types/device_component_details_battery_details")
    autoload :DeviceComponentDetailsCardReaderDetails, ::File.join(__dir__, "square/types/device_component_details_card_reader_details")
    autoload :DeviceComponentDetailsEthernetDetails, ::File.join(__dir__, "square/types/device_component_details_ethernet_details")
    autoload :DeviceComponentDetailsMeasurement, ::File.join(__dir__, "square/types/device_component_details_measurement")
    autoload :DeviceComponentDetailsWiFiDetails, ::File.join(__dir__, "square/types/device_component_details_wi_fi_details")
    autoload :Component, ::File.join(__dir__, "square/types/component")
    autoload :Coordinates, ::File.join(__dir__, "square/types/coordinates")
    autoload :CreateBankAccountResponse, ::File.join(__dir__, "square/types/create_bank_account_response")
    autoload :CreateBookingCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/create_booking_custom_attribute_definition_response")
    autoload :CreateBookingResponse, ::File.join(__dir__, "square/types/create_booking_response")
    autoload :CreateBreakTypeResponse, ::File.join(__dir__, "square/types/create_break_type_response")
    autoload :CreateCardResponse, ::File.join(__dir__, "square/types/create_card_response")
    autoload :CreateCatalogImageRequest, ::File.join(__dir__, "square/types/create_catalog_image_request")
    autoload :CreateCatalogImageResponse, ::File.join(__dir__, "square/types/create_catalog_image_response")
    autoload :CreateCheckoutResponse, ::File.join(__dir__, "square/types/create_checkout_response")
    autoload :CreateCustomerCardResponse, ::File.join(__dir__, "square/types/create_customer_card_response")
    autoload :CreateCustomerCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/create_customer_custom_attribute_definition_response")
    autoload :CustomerGroup, ::File.join(__dir__, "square/types/customer_group")
    autoload :CreateCustomerGroupResponse, ::File.join(__dir__, "square/types/create_customer_group_response")
    autoload :DeviceCodeStatus, ::File.join(__dir__, "square/types/device_code_status")
    autoload :ProductType, ::File.join(__dir__, "square/types/product_type")
    autoload :DeviceCode, ::File.join(__dir__, "square/types/device_code")
    autoload :CreateDeviceCodeResponse, ::File.join(__dir__, "square/types/create_device_code_response")
    autoload :DisputeEvidenceType, ::File.join(__dir__, "square/types/dispute_evidence_type")
    autoload :CreateDisputeEvidenceFileRequest, ::File.join(__dir__, "square/types/create_dispute_evidence_file_request")
    autoload :DisputeEvidenceFile, ::File.join(__dir__, "square/types/dispute_evidence_file")
    autoload :DisputeEvidence, ::File.join(__dir__, "square/types/dispute_evidence")
    autoload :CreateDisputeEvidenceFileResponse, ::File.join(__dir__, "square/types/create_dispute_evidence_file_response")
    autoload :CreateDisputeEvidenceTextResponse, ::File.join(__dir__, "square/types/create_dispute_evidence_text_response")
    autoload :GiftCardActivityActivate, ::File.join(__dir__, "square/types/gift_card_activity_activate")
    autoload :GiftCardActivityAdjustDecrementReason, ::File.join(__dir__, "square/types/gift_card_activity_adjust_decrement_reason")
    autoload :GiftCardActivityAdjustDecrement, ::File.join(__dir__, "square/types/gift_card_activity_adjust_decrement")
    autoload :GiftCardActivityAdjustIncrementReason, ::File.join(__dir__, "square/types/gift_card_activity_adjust_increment_reason")
    autoload :GiftCardActivityAdjustIncrement, ::File.join(__dir__, "square/types/gift_card_activity_adjust_increment")
    autoload :GiftCardActivityBlockReason, ::File.join(__dir__, "square/types/gift_card_activity_block_reason")
    autoload :GiftCardActivityBlock, ::File.join(__dir__, "square/types/gift_card_activity_block")
    autoload :GiftCardActivityClearBalanceReason, ::File.join(__dir__, "square/types/gift_card_activity_clear_balance_reason")
    autoload :GiftCardActivityClearBalance, ::File.join(__dir__, "square/types/gift_card_activity_clear_balance")
    autoload :GiftCardActivityDeactivateReason, ::File.join(__dir__, "square/types/gift_card_activity_deactivate_reason")
    autoload :GiftCardActivityDeactivate, ::File.join(__dir__, "square/types/gift_card_activity_deactivate")
    autoload :GiftCardActivityImport, ::File.join(__dir__, "square/types/gift_card_activity_import")
    autoload :GiftCardActivityImportReversal, ::File.join(__dir__, "square/types/gift_card_activity_import_reversal")
    autoload :GiftCardActivityLoad, ::File.join(__dir__, "square/types/gift_card_activity_load")
    autoload :GiftCardActivityRedeemStatus, ::File.join(__dir__, "square/types/gift_card_activity_redeem_status")
    autoload :GiftCardActivityRedeem, ::File.join(__dir__, "square/types/gift_card_activity_redeem")
    autoload :GiftCardActivityRefund, ::File.join(__dir__, "square/types/gift_card_activity_refund")
    autoload :GiftCardActivityTransferBalanceFrom, ::File.join(__dir__, "square/types/gift_card_activity_transfer_balance_from")
    autoload :GiftCardActivityTransferBalanceTo, ::File.join(__dir__, "square/types/gift_card_activity_transfer_balance_to")
    autoload :GiftCardActivityType, ::File.join(__dir__, "square/types/gift_card_activity_type")
    autoload :GiftCardActivityUnblockReason, ::File.join(__dir__, "square/types/gift_card_activity_unblock_reason")
    autoload :GiftCardActivityUnblock, ::File.join(__dir__, "square/types/gift_card_activity_unblock")
    autoload :GiftCardActivityUnlinkedActivityRefund, ::File.join(__dir__, "square/types/gift_card_activity_unlinked_activity_refund")
    autoload :GiftCardActivity, ::File.join(__dir__, "square/types/gift_card_activity")
    autoload :CreateGiftCardActivityResponse, ::File.join(__dir__, "square/types/create_gift_card_activity_response")
    autoload :GiftCardGanSource, ::File.join(__dir__, "square/types/gift_card_gan_source")
    autoload :GiftCardStatus, ::File.join(__dir__, "square/types/gift_card_status")
    autoload :GiftCardType, ::File.join(__dir__, "square/types/gift_card_type")
    autoload :GiftCard, ::File.join(__dir__, "square/types/gift_card")
    autoload :CreateGiftCardResponse, ::File.join(__dir__, "square/types/create_gift_card_response")
    autoload :InventoryAdjustmentReasonDirection, ::File.join(__dir__, "square/types/inventory_adjustment_reason_direction")
    autoload :InventoryAdjustmentReason, ::File.join(__dir__, "square/types/inventory_adjustment_reason")
    autoload :CreateInventoryAdjustmentReasonResponse, ::File.join(__dir__, "square/types/create_inventory_adjustment_reason_response")
    autoload :CreateInvoiceAttachmentRequestData, ::File.join(__dir__, "square/types/create_invoice_attachment_request_data")
    autoload :CreateInvoiceAttachmentResponse, ::File.join(__dir__, "square/types/create_invoice_attachment_response")
    autoload :CreateInvoiceResponse, ::File.join(__dir__, "square/types/create_invoice_response")
    autoload :Job, ::File.join(__dir__, "square/types/job")
    autoload :CreateJobResponse, ::File.join(__dir__, "square/types/create_job_response")
    autoload :CreateLocationCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/create_location_custom_attribute_definition_response")
    autoload :LocationCapability, ::File.join(__dir__, "square/types/location_capability")
    autoload :LocationStatus, ::File.join(__dir__, "square/types/location_status")
    autoload :LocationType, ::File.join(__dir__, "square/types/location_type")
    autoload :TaxIds, ::File.join(__dir__, "square/types/tax_ids")
    autoload :Location, ::File.join(__dir__, "square/types/location")
    autoload :CreateLocationResponse, ::File.join(__dir__, "square/types/create_location_response")
    autoload :LoyaltyAccountExpiringPointDeadline, ::File.join(__dir__, "square/types/loyalty_account_expiring_point_deadline")
    autoload :LoyaltyAccountMapping, ::File.join(__dir__, "square/types/loyalty_account_mapping")
    autoload :LoyaltyAccount, ::File.join(__dir__, "square/types/loyalty_account")
    autoload :CreateLoyaltyAccountResponse, ::File.join(__dir__, "square/types/create_loyalty_account_response")
    autoload :CreateLoyaltyPromotionResponse, ::File.join(__dir__, "square/types/create_loyalty_promotion_response")
    autoload :LoyaltyRewardStatus, ::File.join(__dir__, "square/types/loyalty_reward_status")
    autoload :LoyaltyReward, ::File.join(__dir__, "square/types/loyalty_reward")
    autoload :CreateLoyaltyRewardResponse, ::File.join(__dir__, "square/types/create_loyalty_reward_response")
    autoload :CreateMerchantCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/create_merchant_custom_attribute_definition_response")
    autoload :CreateOrderCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/create_order_custom_attribute_definition_response")
    autoload :CreateOrderRequest, ::File.join(__dir__, "square/types/create_order_request")
    autoload :CreateOrderResponse, ::File.join(__dir__, "square/types/create_order_response")
    autoload :PrePopulatedData, ::File.join(__dir__, "square/types/pre_populated_data")
    autoload :PaymentLink, ::File.join(__dir__, "square/types/payment_link")
    autoload :PaymentLinkRelatedResources, ::File.join(__dir__, "square/types/payment_link_related_resources")
    autoload :CreatePaymentLinkResponse, ::File.join(__dir__, "square/types/create_payment_link_response")
    autoload :CreatePaymentResponse, ::File.join(__dir__, "square/types/create_payment_response")
    autoload :CreateScheduledShiftResponse, ::File.join(__dir__, "square/types/create_scheduled_shift_response")
    autoload :ShiftStatus, ::File.join(__dir__, "square/types/shift_status")
    autoload :ShiftWage, ::File.join(__dir__, "square/types/shift_wage")
    autoload :Shift, ::File.join(__dir__, "square/types/shift")
    autoload :CreateShiftResponse, ::File.join(__dir__, "square/types/create_shift_response")
    autoload :CreateSubscriptionResponse, ::File.join(__dir__, "square/types/create_subscription_response")
    autoload :CreateTeamMemberRequest, ::File.join(__dir__, "square/types/create_team_member_request")
    autoload :CreateTerminalActionResponse, ::File.join(__dir__, "square/types/create_terminal_action_response")
    autoload :CreateTerminalCheckoutResponse, ::File.join(__dir__, "square/types/create_terminal_checkout_response")
    autoload :CreateTerminalRefundResponse, ::File.join(__dir__, "square/types/create_terminal_refund_response")
    autoload :TimecardStatus, ::File.join(__dir__, "square/types/timecard_status")
    autoload :TimecardWage, ::File.join(__dir__, "square/types/timecard_wage")
    autoload :Timecard, ::File.join(__dir__, "square/types/timecard")
    autoload :CreateTimecardResponse, ::File.join(__dir__, "square/types/create_timecard_response")
    autoload :CreateTransferOrderLineData, ::File.join(__dir__, "square/types/create_transfer_order_line_data")
    autoload :CreateTransferOrderData, ::File.join(__dir__, "square/types/create_transfer_order_data")
    autoload :CreateTransferOrderResponse, ::File.join(__dir__, "square/types/create_transfer_order_response")
    autoload :WebhookSubscription, ::File.join(__dir__, "square/types/webhook_subscription")
    autoload :CreateWebhookSubscriptionResponse, ::File.join(__dir__, "square/types/create_webhook_subscription_response")
    autoload :Range, ::File.join(__dir__, "square/types/range")
    autoload :CustomAttributeFilter, ::File.join(__dir__, "square/types/custom_attribute_filter")
    autoload :CustomerTextFilter, ::File.join(__dir__, "square/types/customer_text_filter")
    autoload :CustomerAddressFilter, ::File.join(__dir__, "square/types/customer_address_filter")
    autoload :CustomerCreatedEventEventContextMerge, ::File.join(__dir__, "square/types/customer_created_event_event_context_merge")
    autoload :CustomerCreatedEventEventContext, ::File.join(__dir__, "square/types/customer_created_event_event_context")
    autoload :CustomerCreatedEventObject, ::File.join(__dir__, "square/types/customer_created_event_object")
    autoload :CustomerCreatedEventData, ::File.join(__dir__, "square/types/customer_created_event_data")
    autoload :CustomerCreatedEvent, ::File.join(__dir__, "square/types/customer_created_event")
    autoload :CustomerInclusionExclusion, ::File.join(__dir__, "square/types/customer_inclusion_exclusion")
    autoload :CustomerCreationSourceFilter, ::File.join(__dir__, "square/types/customer_creation_source_filter")
    autoload :CustomerCustomAttributeDefinitionCreatedEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_definition_created_event")
    autoload :CustomerCustomAttributeDefinitionCreatedPublicEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_definition_created_public_event")
    autoload :CustomerCustomAttributeDefinitionDeletedEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_definition_deleted_event")
    autoload :CustomerCustomAttributeDefinitionDeletedPublicEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_definition_deleted_public_event")
    autoload :CustomerCustomAttributeDefinitionOwnedCreatedEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_definition_owned_created_event")
    autoload :CustomerCustomAttributeDefinitionOwnedDeletedEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_definition_owned_deleted_event")
    autoload :CustomerCustomAttributeDefinitionOwnedUpdatedEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_definition_owned_updated_event")
    autoload :CustomerCustomAttributeDefinitionUpdatedEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_definition_updated_event")
    autoload :CustomerCustomAttributeDefinitionUpdatedPublicEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_definition_updated_public_event")
    autoload :CustomerCustomAttributeDefinitionVisibleCreatedEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_definition_visible_created_event")
    autoload :CustomerCustomAttributeDefinitionVisibleDeletedEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_definition_visible_deleted_event")
    autoload :CustomerCustomAttributeDefinitionVisibleUpdatedEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_definition_visible_updated_event")
    autoload :CustomerCustomAttributeDeletedEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_deleted_event")
    autoload :CustomerCustomAttributeDeletedPublicEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_deleted_public_event")
    autoload :FilterValue, ::File.join(__dir__, "square/types/filter_value")
    autoload :FloatNumberRange, ::File.join(__dir__, "square/types/float_number_range")
    autoload :TimeRange, ::File.join(__dir__, "square/types/time_range")
    autoload :CustomerCustomAttributeFilterValue, ::File.join(__dir__, "square/types/customer_custom_attribute_filter_value")
    autoload :CustomerCustomAttributeFilter, ::File.join(__dir__, "square/types/customer_custom_attribute_filter")
    autoload :CustomerCustomAttributeFilters, ::File.join(__dir__, "square/types/customer_custom_attribute_filters")
    autoload :CustomerCustomAttributeOwnedDeletedEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_owned_deleted_event")
    autoload :CustomerCustomAttributeOwnedUpdatedEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_owned_updated_event")
    autoload :CustomerCustomAttributeUpdatedEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_updated_event")
    autoload :CustomerCustomAttributeUpdatedPublicEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_updated_public_event")
    autoload :CustomerCustomAttributeVisibleDeletedEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_visible_deleted_event")
    autoload :CustomerCustomAttributeVisibleUpdatedEvent, ::File.join(__dir__, "square/types/customer_custom_attribute_visible_updated_event")
    autoload :CustomerDeletedEventEventContextMerge, ::File.join(__dir__, "square/types/customer_deleted_event_event_context_merge")
    autoload :CustomerDeletedEventEventContext, ::File.join(__dir__, "square/types/customer_deleted_event_event_context")
    autoload :CustomerDeletedEventObject, ::File.join(__dir__, "square/types/customer_deleted_event_object")
    autoload :CustomerDeletedEventData, ::File.join(__dir__, "square/types/customer_deleted_event_data")
    autoload :CustomerDeletedEvent, ::File.join(__dir__, "square/types/customer_deleted_event")
    autoload :CustomerDetails, ::File.join(__dir__, "square/types/customer_details")
    autoload :CustomerFilter, ::File.join(__dir__, "square/types/customer_filter")
    autoload :CustomerSortField, ::File.join(__dir__, "square/types/customer_sort_field")
    autoload :CustomerSort, ::File.join(__dir__, "square/types/customer_sort")
    autoload :CustomerQuery, ::File.join(__dir__, "square/types/customer_query")
    autoload :CustomerSegment, ::File.join(__dir__, "square/types/customer_segment")
    autoload :CustomerUpdatedEventObject, ::File.join(__dir__, "square/types/customer_updated_event_object")
    autoload :CustomerUpdatedEventData, ::File.join(__dir__, "square/types/customer_updated_event_data")
    autoload :CustomerUpdatedEvent, ::File.join(__dir__, "square/types/customer_updated_event")
    autoload :DateRange, ::File.join(__dir__, "square/types/date_range")
    autoload :DeleteBookingCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/delete_booking_custom_attribute_definition_response")
    autoload :DeleteBookingCustomAttributeResponse, ::File.join(__dir__, "square/types/delete_booking_custom_attribute_response")
    autoload :DeleteBreakTypeResponse, ::File.join(__dir__, "square/types/delete_break_type_response")
    autoload :DeleteCatalogObjectResponse, ::File.join(__dir__, "square/types/delete_catalog_object_response")
    autoload :DeleteCustomerCardResponse, ::File.join(__dir__, "square/types/delete_customer_card_response")
    autoload :DeleteCustomerCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/delete_customer_custom_attribute_definition_response")
    autoload :DeleteCustomerCustomAttributeResponse, ::File.join(__dir__, "square/types/delete_customer_custom_attribute_response")
    autoload :DeleteCustomerGroupResponse, ::File.join(__dir__, "square/types/delete_customer_group_response")
    autoload :DeleteDisputeEvidenceResponse, ::File.join(__dir__, "square/types/delete_dispute_evidence_response")
    autoload :DeleteInventoryAdjustmentReasonResponse, ::File.join(__dir__, "square/types/delete_inventory_adjustment_reason_response")
    autoload :DeleteInvoiceAttachmentResponse, ::File.join(__dir__, "square/types/delete_invoice_attachment_response")
    autoload :DeleteInvoiceResponse, ::File.join(__dir__, "square/types/delete_invoice_response")
    autoload :DeleteLocationCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/delete_location_custom_attribute_definition_response")
    autoload :DeleteLocationCustomAttributeResponse, ::File.join(__dir__, "square/types/delete_location_custom_attribute_response")
    autoload :DeleteLoyaltyRewardResponse, ::File.join(__dir__, "square/types/delete_loyalty_reward_response")
    autoload :DeleteMerchantCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/delete_merchant_custom_attribute_definition_response")
    autoload :DeleteMerchantCustomAttributeResponse, ::File.join(__dir__, "square/types/delete_merchant_custom_attribute_response")
    autoload :DeleteOrderCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/delete_order_custom_attribute_definition_response")
    autoload :DeletePaymentLinkResponse, ::File.join(__dir__, "square/types/delete_payment_link_response")
    autoload :DeleteShiftResponse, ::File.join(__dir__, "square/types/delete_shift_response")
    autoload :DeleteSnippetResponse, ::File.join(__dir__, "square/types/delete_snippet_response")
    autoload :DeleteSubscriptionActionResponse, ::File.join(__dir__, "square/types/delete_subscription_action_response")
    autoload :DeleteTimecardResponse, ::File.join(__dir__, "square/types/delete_timecard_response")
    autoload :DeleteTransferOrderResponse, ::File.join(__dir__, "square/types/delete_transfer_order_response")
    autoload :DeleteWebhookSubscriptionResponse, ::File.join(__dir__, "square/types/delete_webhook_subscription_response")
    autoload :DestinationType, ::File.join(__dir__, "square/types/destination_type")
    autoload :Destination, ::File.join(__dir__, "square/types/destination")
    autoload :DestinationDetailsCardRefundDetails, ::File.join(__dir__, "square/types/destination_details_card_refund_details")
    autoload :DestinationDetailsCashRefundDetails, ::File.join(__dir__, "square/types/destination_details_cash_refund_details")
    autoload :DestinationDetailsExternalRefundDetails, ::File.join(__dir__, "square/types/destination_details_external_refund_details")
    autoload :DestinationDetails, ::File.join(__dir__, "square/types/destination_details")
    autoload :DeviceAttributesDeviceType, ::File.join(__dir__, "square/types/device_attributes_device_type")
    autoload :DeviceAttributes, ::File.join(__dir__, "square/types/device_attributes")
    autoload :DeviceStatusCategory, ::File.join(__dir__, "square/types/device_status_category")
    autoload :DeviceStatus, ::File.join(__dir__, "square/types/device_status")
    autoload :Device, ::File.join(__dir__, "square/types/device")
    autoload :DeviceCodePairedEventObject, ::File.join(__dir__, "square/types/device_code_paired_event_object")
    autoload :DeviceCodePairedEventData, ::File.join(__dir__, "square/types/device_code_paired_event_data")
    autoload :DeviceCodePairedEvent, ::File.join(__dir__, "square/types/device_code_paired_event")
    autoload :DeviceCreatedEventObject, ::File.join(__dir__, "square/types/device_created_event_object")
    autoload :DeviceCreatedEventData, ::File.join(__dir__, "square/types/device_created_event_data")
    autoload :DeviceCreatedEvent, ::File.join(__dir__, "square/types/device_created_event")
    autoload :DisableBankAccountResponse, ::File.join(__dir__, "square/types/disable_bank_account_response")
    autoload :DisableCardResponse, ::File.join(__dir__, "square/types/disable_card_response")
    autoload :DisableEventsResponse, ::File.join(__dir__, "square/types/disable_events_response")
    autoload :DismissTerminalActionResponse, ::File.join(__dir__, "square/types/dismiss_terminal_action_response")
    autoload :DismissTerminalCheckoutResponse, ::File.join(__dir__, "square/types/dismiss_terminal_checkout_response")
    autoload :DismissTerminalRefundResponse, ::File.join(__dir__, "square/types/dismiss_terminal_refund_response")
    autoload :DisputeCreatedEventObject, ::File.join(__dir__, "square/types/dispute_created_event_object")
    autoload :DisputeCreatedEventData, ::File.join(__dir__, "square/types/dispute_created_event_data")
    autoload :DisputeCreatedEvent, ::File.join(__dir__, "square/types/dispute_created_event")
    autoload :DisputeEvidenceAddedEventObject, ::File.join(__dir__, "square/types/dispute_evidence_added_event_object")
    autoload :DisputeEvidenceAddedEventData, ::File.join(__dir__, "square/types/dispute_evidence_added_event_data")
    autoload :DisputeEvidenceAddedEvent, ::File.join(__dir__, "square/types/dispute_evidence_added_event")
    autoload :DisputeEvidenceCreatedEventObject, ::File.join(__dir__, "square/types/dispute_evidence_created_event_object")
    autoload :DisputeEvidenceCreatedEventData, ::File.join(__dir__, "square/types/dispute_evidence_created_event_data")
    autoload :DisputeEvidenceCreatedEvent, ::File.join(__dir__, "square/types/dispute_evidence_created_event")
    autoload :DisputeEvidenceDeletedEventObject, ::File.join(__dir__, "square/types/dispute_evidence_deleted_event_object")
    autoload :DisputeEvidenceDeletedEventData, ::File.join(__dir__, "square/types/dispute_evidence_deleted_event_data")
    autoload :DisputeEvidenceDeletedEvent, ::File.join(__dir__, "square/types/dispute_evidence_deleted_event")
    autoload :DisputeEvidenceRemovedEventObject, ::File.join(__dir__, "square/types/dispute_evidence_removed_event_object")
    autoload :DisputeEvidenceRemovedEventData, ::File.join(__dir__, "square/types/dispute_evidence_removed_event_data")
    autoload :DisputeEvidenceRemovedEvent, ::File.join(__dir__, "square/types/dispute_evidence_removed_event")
    autoload :DisputeStateChangedEventObject, ::File.join(__dir__, "square/types/dispute_state_changed_event_object")
    autoload :DisputeStateChangedEventData, ::File.join(__dir__, "square/types/dispute_state_changed_event_data")
    autoload :DisputeStateChangedEvent, ::File.join(__dir__, "square/types/dispute_state_changed_event")
    autoload :DisputeStateUpdatedEventObject, ::File.join(__dir__, "square/types/dispute_state_updated_event_object")
    autoload :DisputeStateUpdatedEventData, ::File.join(__dir__, "square/types/dispute_state_updated_event_data")
    autoload :DisputeStateUpdatedEvent, ::File.join(__dir__, "square/types/dispute_state_updated_event")
    autoload :EcomVisibility, ::File.join(__dir__, "square/types/ecom_visibility")
    autoload :EmployeeStatus, ::File.join(__dir__, "square/types/employee_status")
    autoload :Employee, ::File.join(__dir__, "square/types/employee")
    autoload :EmployeeWage, ::File.join(__dir__, "square/types/employee_wage")
    autoload :EnableEventsResponse, ::File.join(__dir__, "square/types/enable_events_response")
    autoload :EventData, ::File.join(__dir__, "square/types/event_data")
    autoload :Event, ::File.join(__dir__, "square/types/event")
    autoload :EventMetadata, ::File.join(__dir__, "square/types/event_metadata")
    autoload :EventTypeMetadata, ::File.join(__dir__, "square/types/event_type_metadata")
    autoload :GetBankAccountByV1IdResponse, ::File.join(__dir__, "square/types/get_bank_account_by_v_1_id_response")
    autoload :GetBankAccountResponse, ::File.join(__dir__, "square/types/get_bank_account_response")
    autoload :GetBreakTypeResponse, ::File.join(__dir__, "square/types/get_break_type_response")
    autoload :GetDeviceCodeResponse, ::File.join(__dir__, "square/types/get_device_code_response")
    autoload :GetDeviceResponse, ::File.join(__dir__, "square/types/get_device_response")
    autoload :GetEmployeeWageResponse, ::File.join(__dir__, "square/types/get_employee_wage_response")
    autoload :GetInvoiceResponse, ::File.join(__dir__, "square/types/get_invoice_response")
    autoload :PaymentRefund, ::File.join(__dir__, "square/types/payment_refund")
    autoload :GetPaymentRefundResponse, ::File.join(__dir__, "square/types/get_payment_refund_response")
    autoload :GetPaymentResponse, ::File.join(__dir__, "square/types/get_payment_response")
    autoload :PayoutFeeType, ::File.join(__dir__, "square/types/payout_fee_type")
    autoload :PayoutFee, ::File.join(__dir__, "square/types/payout_fee")
    autoload :PayoutStatus, ::File.join(__dir__, "square/types/payout_status")
    autoload :PayoutType, ::File.join(__dir__, "square/types/payout_type")
    autoload :Payout, ::File.join(__dir__, "square/types/payout")
    autoload :GetPayoutResponse, ::File.join(__dir__, "square/types/get_payout_response")
    autoload :GetShiftResponse, ::File.join(__dir__, "square/types/get_shift_response")
    autoload :TeamMemberWage, ::File.join(__dir__, "square/types/team_member_wage")
    autoload :GetTeamMemberWageResponse, ::File.join(__dir__, "square/types/get_team_member_wage_response")
    autoload :GetTerminalActionResponse, ::File.join(__dir__, "square/types/get_terminal_action_response")
    autoload :GetTerminalCheckoutResponse, ::File.join(__dir__, "square/types/get_terminal_checkout_response")
    autoload :GetTerminalRefundResponse, ::File.join(__dir__, "square/types/get_terminal_refund_response")
    autoload :GiftCardActivityCreatedEventObject, ::File.join(__dir__, "square/types/gift_card_activity_created_event_object")
    autoload :GiftCardActivityCreatedEventData, ::File.join(__dir__, "square/types/gift_card_activity_created_event_data")
    autoload :GiftCardActivityCreatedEvent, ::File.join(__dir__, "square/types/gift_card_activity_created_event")
    autoload :GiftCardActivityUpdatedEventObject, ::File.join(__dir__, "square/types/gift_card_activity_updated_event_object")
    autoload :GiftCardActivityUpdatedEventData, ::File.join(__dir__, "square/types/gift_card_activity_updated_event_data")
    autoload :GiftCardActivityUpdatedEvent, ::File.join(__dir__, "square/types/gift_card_activity_updated_event")
    autoload :GiftCardCreatedEventObject, ::File.join(__dir__, "square/types/gift_card_created_event_object")
    autoload :GiftCardCreatedEventData, ::File.join(__dir__, "square/types/gift_card_created_event_data")
    autoload :GiftCardCreatedEvent, ::File.join(__dir__, "square/types/gift_card_created_event")
    autoload :GiftCardCustomerLinkedEventObject, ::File.join(__dir__, "square/types/gift_card_customer_linked_event_object")
    autoload :GiftCardCustomerLinkedEventData, ::File.join(__dir__, "square/types/gift_card_customer_linked_event_data")
    autoload :GiftCardCustomerLinkedEvent, ::File.join(__dir__, "square/types/gift_card_customer_linked_event")
    autoload :GiftCardCustomerUnlinkedEventObject, ::File.join(__dir__, "square/types/gift_card_customer_unlinked_event_object")
    autoload :GiftCardCustomerUnlinkedEventData, ::File.join(__dir__, "square/types/gift_card_customer_unlinked_event_data")
    autoload :GiftCardCustomerUnlinkedEvent, ::File.join(__dir__, "square/types/gift_card_customer_unlinked_event")
    autoload :GiftCardUpdatedEventObject, ::File.join(__dir__, "square/types/gift_card_updated_event_object")
    autoload :GiftCardUpdatedEventData, ::File.join(__dir__, "square/types/gift_card_updated_event_data")
    autoload :GiftCardUpdatedEvent, ::File.join(__dir__, "square/types/gift_card_updated_event")
    autoload :IncludeType, ::File.join(__dir__, "square/types/include_type")
    autoload :IncludeOptions, ::File.join(__dir__, "square/types/include_options")
    autoload :InventoryCountUpdatedEventObject, ::File.join(__dir__, "square/types/inventory_count_updated_event_object")
    autoload :InventoryCountUpdatedEventData, ::File.join(__dir__, "square/types/inventory_count_updated_event_data")
    autoload :InventoryCountUpdatedEvent, ::File.join(__dir__, "square/types/inventory_count_updated_event")
    autoload :InvoiceCanceledEventObject, ::File.join(__dir__, "square/types/invoice_canceled_event_object")
    autoload :InvoiceCanceledEventData, ::File.join(__dir__, "square/types/invoice_canceled_event_data")
    autoload :InvoiceCanceledEvent, ::File.join(__dir__, "square/types/invoice_canceled_event")
    autoload :InvoiceCreatedEventObject, ::File.join(__dir__, "square/types/invoice_created_event_object")
    autoload :InvoiceCreatedEventData, ::File.join(__dir__, "square/types/invoice_created_event_data")
    autoload :InvoiceCreatedEvent, ::File.join(__dir__, "square/types/invoice_created_event")
    autoload :InvoiceDeletedEventData, ::File.join(__dir__, "square/types/invoice_deleted_event_data")
    autoload :InvoiceDeletedEvent, ::File.join(__dir__, "square/types/invoice_deleted_event")
    autoload :InvoiceFilter, ::File.join(__dir__, "square/types/invoice_filter")
    autoload :InvoicePaymentMadeEventObject, ::File.join(__dir__, "square/types/invoice_payment_made_event_object")
    autoload :InvoicePaymentMadeEventData, ::File.join(__dir__, "square/types/invoice_payment_made_event_data")
    autoload :InvoicePaymentMadeEvent, ::File.join(__dir__, "square/types/invoice_payment_made_event")
    autoload :InvoicePublishedEventObject, ::File.join(__dir__, "square/types/invoice_published_event_object")
    autoload :InvoicePublishedEventData, ::File.join(__dir__, "square/types/invoice_published_event_data")
    autoload :InvoicePublishedEvent, ::File.join(__dir__, "square/types/invoice_published_event")
    autoload :InvoiceSortField, ::File.join(__dir__, "square/types/invoice_sort_field")
    autoload :InvoiceSort, ::File.join(__dir__, "square/types/invoice_sort")
    autoload :InvoiceQuery, ::File.join(__dir__, "square/types/invoice_query")
    autoload :InvoiceRefundedEventObject, ::File.join(__dir__, "square/types/invoice_refunded_event_object")
    autoload :InvoiceRefundedEventData, ::File.join(__dir__, "square/types/invoice_refunded_event_data")
    autoload :InvoiceRefundedEvent, ::File.join(__dir__, "square/types/invoice_refunded_event")
    autoload :InvoiceScheduledChargeFailedEventObject, ::File.join(__dir__, "square/types/invoice_scheduled_charge_failed_event_object")
    autoload :InvoiceScheduledChargeFailedEventData, ::File.join(__dir__, "square/types/invoice_scheduled_charge_failed_event_data")
    autoload :InvoiceScheduledChargeFailedEvent, ::File.join(__dir__, "square/types/invoice_scheduled_charge_failed_event")
    autoload :InvoiceUpdatedEventObject, ::File.join(__dir__, "square/types/invoice_updated_event_object")
    autoload :InvoiceUpdatedEventData, ::File.join(__dir__, "square/types/invoice_updated_event_data")
    autoload :InvoiceUpdatedEvent, ::File.join(__dir__, "square/types/invoice_updated_event")
    autoload :JobCreatedEventObject, ::File.join(__dir__, "square/types/job_created_event_object")
    autoload :JobCreatedEventData, ::File.join(__dir__, "square/types/job_created_event_data")
    autoload :JobCreatedEvent, ::File.join(__dir__, "square/types/job_created_event")
    autoload :JobUpdatedEventObject, ::File.join(__dir__, "square/types/job_updated_event_object")
    autoload :JobUpdatedEventData, ::File.join(__dir__, "square/types/job_updated_event_data")
    autoload :JobUpdatedEvent, ::File.join(__dir__, "square/types/job_updated_event")
    autoload :LaborScheduledShiftCreatedEventObject, ::File.join(__dir__, "square/types/labor_scheduled_shift_created_event_object")
    autoload :LaborScheduledShiftCreatedEventData, ::File.join(__dir__, "square/types/labor_scheduled_shift_created_event_data")
    autoload :LaborScheduledShiftCreatedEvent, ::File.join(__dir__, "square/types/labor_scheduled_shift_created_event")
    autoload :LaborScheduledShiftDeletedEventData, ::File.join(__dir__, "square/types/labor_scheduled_shift_deleted_event_data")
    autoload :LaborScheduledShiftDeletedEvent, ::File.join(__dir__, "square/types/labor_scheduled_shift_deleted_event")
    autoload :LaborScheduledShiftPublishedEventObject, ::File.join(__dir__, "square/types/labor_scheduled_shift_published_event_object")
    autoload :LaborScheduledShiftPublishedEventData, ::File.join(__dir__, "square/types/labor_scheduled_shift_published_event_data")
    autoload :LaborScheduledShiftPublishedEvent, ::File.join(__dir__, "square/types/labor_scheduled_shift_published_event")
    autoload :LaborScheduledShiftUpdatedEventObject, ::File.join(__dir__, "square/types/labor_scheduled_shift_updated_event_object")
    autoload :LaborScheduledShiftUpdatedEventData, ::File.join(__dir__, "square/types/labor_scheduled_shift_updated_event_data")
    autoload :LaborScheduledShiftUpdatedEvent, ::File.join(__dir__, "square/types/labor_scheduled_shift_updated_event")
    autoload :LaborShiftCreatedEventObject, ::File.join(__dir__, "square/types/labor_shift_created_event_object")
    autoload :LaborShiftCreatedEventData, ::File.join(__dir__, "square/types/labor_shift_created_event_data")
    autoload :LaborShiftCreatedEvent, ::File.join(__dir__, "square/types/labor_shift_created_event")
    autoload :LaborShiftDeletedEventData, ::File.join(__dir__, "square/types/labor_shift_deleted_event_data")
    autoload :LaborShiftDeletedEvent, ::File.join(__dir__, "square/types/labor_shift_deleted_event")
    autoload :LaborShiftUpdatedEventObject, ::File.join(__dir__, "square/types/labor_shift_updated_event_object")
    autoload :LaborShiftUpdatedEventData, ::File.join(__dir__, "square/types/labor_shift_updated_event_data")
    autoload :LaborShiftUpdatedEvent, ::File.join(__dir__, "square/types/labor_shift_updated_event")
    autoload :LaborTimecardCreatedEventObject, ::File.join(__dir__, "square/types/labor_timecard_created_event_object")
    autoload :LaborTimecardCreatedEventData, ::File.join(__dir__, "square/types/labor_timecard_created_event_data")
    autoload :LaborTimecardCreatedEvent, ::File.join(__dir__, "square/types/labor_timecard_created_event")
    autoload :LaborTimecardDeletedEventData, ::File.join(__dir__, "square/types/labor_timecard_deleted_event_data")
    autoload :LaborTimecardDeletedEvent, ::File.join(__dir__, "square/types/labor_timecard_deleted_event")
    autoload :LaborTimecardUpdatedEventObject, ::File.join(__dir__, "square/types/labor_timecard_updated_event_object")
    autoload :LaborTimecardUpdatedEventData, ::File.join(__dir__, "square/types/labor_timecard_updated_event_data")
    autoload :LaborTimecardUpdatedEvent, ::File.join(__dir__, "square/types/labor_timecard_updated_event")
    autoload :LinkCustomerToGiftCardResponse, ::File.join(__dir__, "square/types/link_customer_to_gift_card_response")
    autoload :ListBankAccountsResponse, ::File.join(__dir__, "square/types/list_bank_accounts_response")
    autoload :ListBookingCustomAttributeDefinitionsResponse, ::File.join(__dir__, "square/types/list_booking_custom_attribute_definitions_response")
    autoload :ListBookingCustomAttributesResponse, ::File.join(__dir__, "square/types/list_booking_custom_attributes_response")
    autoload :ListBookingsResponse, ::File.join(__dir__, "square/types/list_bookings_response")
    autoload :ListBreakTypesResponse, ::File.join(__dir__, "square/types/list_break_types_response")
    autoload :ListCardsResponse, ::File.join(__dir__, "square/types/list_cards_response")
    autoload :ListCashDrawerShiftEventsResponse, ::File.join(__dir__, "square/types/list_cash_drawer_shift_events_response")
    autoload :ListCashDrawerShiftsResponse, ::File.join(__dir__, "square/types/list_cash_drawer_shifts_response")
    autoload :ListCatalogResponse, ::File.join(__dir__, "square/types/list_catalog_response")
    autoload :ListChannelsRequestConstants, ::File.join(__dir__, "square/types/list_channels_request_constants")
    autoload :ListChannelsResponse, ::File.join(__dir__, "square/types/list_channels_response")
    autoload :ListCustomerCustomAttributeDefinitionsResponse, ::File.join(__dir__, "square/types/list_customer_custom_attribute_definitions_response")
    autoload :ListCustomerCustomAttributesResponse, ::File.join(__dir__, "square/types/list_customer_custom_attributes_response")
    autoload :ListCustomerGroupsResponse, ::File.join(__dir__, "square/types/list_customer_groups_response")
    autoload :ListCustomerSegmentsResponse, ::File.join(__dir__, "square/types/list_customer_segments_response")
    autoload :ListCustomersResponse, ::File.join(__dir__, "square/types/list_customers_response")
    autoload :ListDeviceCodesResponse, ::File.join(__dir__, "square/types/list_device_codes_response")
    autoload :ListDevicesResponse, ::File.join(__dir__, "square/types/list_devices_response")
    autoload :ListDisputeEvidenceResponse, ::File.join(__dir__, "square/types/list_dispute_evidence_response")
    autoload :ListDisputesResponse, ::File.join(__dir__, "square/types/list_disputes_response")
    autoload :ListEmployeeWagesResponse, ::File.join(__dir__, "square/types/list_employee_wages_response")
    autoload :ListEmployeesResponse, ::File.join(__dir__, "square/types/list_employees_response")
    autoload :ListEventTypesResponse, ::File.join(__dir__, "square/types/list_event_types_response")
    autoload :ListGiftCardActivitiesResponse, ::File.join(__dir__, "square/types/list_gift_card_activities_response")
    autoload :ListGiftCardsResponse, ::File.join(__dir__, "square/types/list_gift_cards_response")
    autoload :ListInventoryAdjustmentReasonsResponse, ::File.join(__dir__, "square/types/list_inventory_adjustment_reasons_response")
    autoload :ListInvoicesResponse, ::File.join(__dir__, "square/types/list_invoices_response")
    autoload :ListJobsResponse, ::File.join(__dir__, "square/types/list_jobs_response")
    autoload :LocationBookingProfile, ::File.join(__dir__, "square/types/location_booking_profile")
    autoload :ListLocationBookingProfilesResponse, ::File.join(__dir__, "square/types/list_location_booking_profiles_response")
    autoload :ListLocationCustomAttributeDefinitionsResponse, ::File.join(__dir__, "square/types/list_location_custom_attribute_definitions_response")
    autoload :ListLocationCustomAttributesResponse, ::File.join(__dir__, "square/types/list_location_custom_attributes_response")
    autoload :ListLocationsResponse, ::File.join(__dir__, "square/types/list_locations_response")
    autoload :LoyaltyProgramAccrualRuleCategoryData, ::File.join(__dir__, "square/types/loyalty_program_accrual_rule_category_data")
    autoload :LoyaltyProgramAccrualRuleItemVariationData, ::File.join(__dir__, "square/types/loyalty_program_accrual_rule_item_variation_data")
    autoload :LoyaltyProgramAccrualRuleTaxMode, ::File.join(__dir__, "square/types/loyalty_program_accrual_rule_tax_mode")
    autoload :LoyaltyProgramAccrualRuleSpendData, ::File.join(__dir__, "square/types/loyalty_program_accrual_rule_spend_data")
    autoload :LoyaltyProgramAccrualRuleType, ::File.join(__dir__, "square/types/loyalty_program_accrual_rule_type")
    autoload :LoyaltyProgramAccrualRuleVisitData, ::File.join(__dir__, "square/types/loyalty_program_accrual_rule_visit_data")
    autoload :LoyaltyProgramAccrualRule, ::File.join(__dir__, "square/types/loyalty_program_accrual_rule")
    autoload :LoyaltyProgramExpirationPolicy, ::File.join(__dir__, "square/types/loyalty_program_expiration_policy")
    autoload :LoyaltyProgramRewardTier, ::File.join(__dir__, "square/types/loyalty_program_reward_tier")
    autoload :LoyaltyProgramStatus, ::File.join(__dir__, "square/types/loyalty_program_status")
    autoload :LoyaltyProgramTerminology, ::File.join(__dir__, "square/types/loyalty_program_terminology")
    autoload :LoyaltyProgram, ::File.join(__dir__, "square/types/loyalty_program")
    autoload :ListLoyaltyProgramsResponse, ::File.join(__dir__, "square/types/list_loyalty_programs_response")
    autoload :ListLoyaltyPromotionsResponse, ::File.join(__dir__, "square/types/list_loyalty_promotions_response")
    autoload :ListMerchantCustomAttributeDefinitionsResponse, ::File.join(__dir__, "square/types/list_merchant_custom_attribute_definitions_response")
    autoload :ListMerchantCustomAttributesResponse, ::File.join(__dir__, "square/types/list_merchant_custom_attributes_response")
    autoload :MerchantStatus, ::File.join(__dir__, "square/types/merchant_status")
    autoload :Merchant, ::File.join(__dir__, "square/types/merchant")
    autoload :ListMerchantsResponse, ::File.join(__dir__, "square/types/list_merchants_response")
    autoload :ListOrderCustomAttributeDefinitionsResponse, ::File.join(__dir__, "square/types/list_order_custom_attribute_definitions_response")
    autoload :ListOrderCustomAttributesResponse, ::File.join(__dir__, "square/types/list_order_custom_attributes_response")
    autoload :ListPaymentLinksResponse, ::File.join(__dir__, "square/types/list_payment_links_response")
    autoload :ListPaymentRefundsRequestSortField, ::File.join(__dir__, "square/types/list_payment_refunds_request_sort_field")
    autoload :ListPaymentRefundsResponse, ::File.join(__dir__, "square/types/list_payment_refunds_response")
    autoload :ListPaymentsRequestSortField, ::File.join(__dir__, "square/types/list_payments_request_sort_field")
    autoload :ListPaymentsResponse, ::File.join(__dir__, "square/types/list_payments_response")
    autoload :PaymentBalanceActivityAppFeeRefundDetail, ::File.join(__dir__, "square/types/payment_balance_activity_app_fee_refund_detail")
    autoload :PaymentBalanceActivityAppFeeRevenueDetail, ::File.join(__dir__, "square/types/payment_balance_activity_app_fee_revenue_detail")
    autoload :PaymentBalanceActivityAutomaticSavingsDetail, ::File.join(__dir__, "square/types/payment_balance_activity_automatic_savings_detail")
    autoload :PaymentBalanceActivityAutomaticSavingsReversedDetail, ::File.join(__dir__, "square/types/payment_balance_activity_automatic_savings_reversed_detail")
    autoload :PaymentBalanceActivityChargeDetail, ::File.join(__dir__, "square/types/payment_balance_activity_charge_detail")
    autoload :PaymentBalanceActivityDepositFeeDetail, ::File.join(__dir__, "square/types/payment_balance_activity_deposit_fee_detail")
    autoload :PaymentBalanceActivityDepositFeeReversedDetail, ::File.join(__dir__, "square/types/payment_balance_activity_deposit_fee_reversed_detail")
    autoload :PaymentBalanceActivityDisputeDetail, ::File.join(__dir__, "square/types/payment_balance_activity_dispute_detail")
    autoload :PaymentBalanceActivityFeeDetail, ::File.join(__dir__, "square/types/payment_balance_activity_fee_detail")
    autoload :PaymentBalanceActivityFreeProcessingDetail, ::File.join(__dir__, "square/types/payment_balance_activity_free_processing_detail")
    autoload :PaymentBalanceActivityHoldAdjustmentDetail, ::File.join(__dir__, "square/types/payment_balance_activity_hold_adjustment_detail")
    autoload :PaymentBalanceActivityOpenDisputeDetail, ::File.join(__dir__, "square/types/payment_balance_activity_open_dispute_detail")
    autoload :PaymentBalanceActivityOtherAdjustmentDetail, ::File.join(__dir__, "square/types/payment_balance_activity_other_adjustment_detail")
    autoload :PaymentBalanceActivityOtherDetail, ::File.join(__dir__, "square/types/payment_balance_activity_other_detail")
    autoload :PaymentBalanceActivityRefundDetail, ::File.join(__dir__, "square/types/payment_balance_activity_refund_detail")
    autoload :PaymentBalanceActivityReleaseAdjustmentDetail, ::File.join(__dir__, "square/types/payment_balance_activity_release_adjustment_detail")
    autoload :PaymentBalanceActivityReserveHoldDetail, ::File.join(__dir__, "square/types/payment_balance_activity_reserve_hold_detail")
    autoload :PaymentBalanceActivityReserveReleaseDetail, ::File.join(__dir__, "square/types/payment_balance_activity_reserve_release_detail")
    autoload :PaymentBalanceActivitySquareCapitalPaymentDetail, ::File.join(__dir__, "square/types/payment_balance_activity_square_capital_payment_detail")
    autoload :PaymentBalanceActivitySquareCapitalReversedPaymentDetail, ::File.join(__dir__, "square/types/payment_balance_activity_square_capital_reversed_payment_detail")
    autoload :PaymentBalanceActivitySquarePayrollTransferDetail, ::File.join(__dir__, "square/types/payment_balance_activity_square_payroll_transfer_detail")
    autoload :PaymentBalanceActivitySquarePayrollTransferReversedDetail, ::File.join(__dir__, "square/types/payment_balance_activity_square_payroll_transfer_reversed_detail")
    autoload :PaymentBalanceActivityTaxOnFeeDetail, ::File.join(__dir__, "square/types/payment_balance_activity_tax_on_fee_detail")
    autoload :PaymentBalanceActivityThirdPartyFeeDetail, ::File.join(__dir__, "square/types/payment_balance_activity_third_party_fee_detail")
    autoload :PaymentBalanceActivityThirdPartyFeeRefundDetail, ::File.join(__dir__, "square/types/payment_balance_activity_third_party_fee_refund_detail")
    autoload :PayoutEntry, ::File.join(__dir__, "square/types/payout_entry")
    autoload :ListPayoutEntriesResponse, ::File.join(__dir__, "square/types/list_payout_entries_response")
    autoload :ListPayoutsResponse, ::File.join(__dir__, "square/types/list_payouts_response")
    autoload :Site, ::File.join(__dir__, "square/types/site")
    autoload :ListSitesResponse, ::File.join(__dir__, "square/types/list_sites_response")
    autoload :SubscriptionEventInfoCode, ::File.join(__dir__, "square/types/subscription_event_info_code")
    autoload :SubscriptionEventInfo, ::File.join(__dir__, "square/types/subscription_event_info")
    autoload :SubscriptionEventSubscriptionEventType, ::File.join(__dir__, "square/types/subscription_event_subscription_event_type")
    autoload :SubscriptionEvent, ::File.join(__dir__, "square/types/subscription_event")
    autoload :ListSubscriptionEventsResponse, ::File.join(__dir__, "square/types/list_subscription_events_response")
    autoload :ListTeamMemberBookingProfilesResponse, ::File.join(__dir__, "square/types/list_team_member_booking_profiles_response")
    autoload :ListTeamMemberWagesResponse, ::File.join(__dir__, "square/types/list_team_member_wages_response")
    autoload :TransactionProduct, ::File.join(__dir__, "square/types/transaction_product")
    autoload :Transaction, ::File.join(__dir__, "square/types/transaction")
    autoload :ListTransactionsResponse, ::File.join(__dir__, "square/types/list_transactions_response")
    autoload :ListWebhookEventTypesResponse, ::File.join(__dir__, "square/types/list_webhook_event_types_response")
    autoload :ListWebhookSubscriptionsResponse, ::File.join(__dir__, "square/types/list_webhook_subscriptions_response")
    autoload :Weekday, ::File.join(__dir__, "square/types/weekday")
    autoload :WorkweekConfig, ::File.join(__dir__, "square/types/workweek_config")
    autoload :ListWorkweekConfigsResponse, ::File.join(__dir__, "square/types/list_workweek_configs_response")
    autoload :LocationCreatedEventData, ::File.join(__dir__, "square/types/location_created_event_data")
    autoload :LocationCreatedEvent, ::File.join(__dir__, "square/types/location_created_event")
    autoload :LocationCustomAttributeDefinitionOwnedCreatedEvent, ::File.join(__dir__, "square/types/location_custom_attribute_definition_owned_created_event")
    autoload :LocationCustomAttributeDefinitionOwnedDeletedEvent, ::File.join(__dir__, "square/types/location_custom_attribute_definition_owned_deleted_event")
    autoload :LocationCustomAttributeDefinitionOwnedUpdatedEvent, ::File.join(__dir__, "square/types/location_custom_attribute_definition_owned_updated_event")
    autoload :LocationCustomAttributeDefinitionVisibleCreatedEvent, ::File.join(__dir__, "square/types/location_custom_attribute_definition_visible_created_event")
    autoload :LocationCustomAttributeDefinitionVisibleDeletedEvent, ::File.join(__dir__, "square/types/location_custom_attribute_definition_visible_deleted_event")
    autoload :LocationCustomAttributeDefinitionVisibleUpdatedEvent, ::File.join(__dir__, "square/types/location_custom_attribute_definition_visible_updated_event")
    autoload :LocationCustomAttributeOwnedDeletedEvent, ::File.join(__dir__, "square/types/location_custom_attribute_owned_deleted_event")
    autoload :LocationCustomAttributeOwnedUpdatedEvent, ::File.join(__dir__, "square/types/location_custom_attribute_owned_updated_event")
    autoload :LocationCustomAttributeVisibleDeletedEvent, ::File.join(__dir__, "square/types/location_custom_attribute_visible_deleted_event")
    autoload :LocationCustomAttributeVisibleUpdatedEvent, ::File.join(__dir__, "square/types/location_custom_attribute_visible_updated_event")
    autoload :LocationSettingsUpdatedEventObject, ::File.join(__dir__, "square/types/location_settings_updated_event_object")
    autoload :LocationSettingsUpdatedEventData, ::File.join(__dir__, "square/types/location_settings_updated_event_data")
    autoload :LocationSettingsUpdatedEvent, ::File.join(__dir__, "square/types/location_settings_updated_event")
    autoload :LocationUpdatedEventData, ::File.join(__dir__, "square/types/location_updated_event_data")
    autoload :LocationUpdatedEvent, ::File.join(__dir__, "square/types/location_updated_event")
    autoload :LoyaltyAccountCreatedEventObject, ::File.join(__dir__, "square/types/loyalty_account_created_event_object")
    autoload :LoyaltyAccountCreatedEventData, ::File.join(__dir__, "square/types/loyalty_account_created_event_data")
    autoload :LoyaltyAccountCreatedEvent, ::File.join(__dir__, "square/types/loyalty_account_created_event")
    autoload :LoyaltyAccountDeletedEventObject, ::File.join(__dir__, "square/types/loyalty_account_deleted_event_object")
    autoload :LoyaltyAccountDeletedEventData, ::File.join(__dir__, "square/types/loyalty_account_deleted_event_data")
    autoload :LoyaltyAccountDeletedEvent, ::File.join(__dir__, "square/types/loyalty_account_deleted_event")
    autoload :LoyaltyAccountMappingType, ::File.join(__dir__, "square/types/loyalty_account_mapping_type")
    autoload :LoyaltyAccountUpdatedEventObject, ::File.join(__dir__, "square/types/loyalty_account_updated_event_object")
    autoload :LoyaltyAccountUpdatedEventData, ::File.join(__dir__, "square/types/loyalty_account_updated_event_data")
    autoload :LoyaltyAccountUpdatedEvent, ::File.join(__dir__, "square/types/loyalty_account_updated_event")
    autoload :LoyaltyEventCreatedEventObject, ::File.join(__dir__, "square/types/loyalty_event_created_event_object")
    autoload :LoyaltyEventCreatedEventData, ::File.join(__dir__, "square/types/loyalty_event_created_event_data")
    autoload :LoyaltyEventCreatedEvent, ::File.join(__dir__, "square/types/loyalty_event_created_event")
    autoload :LoyaltyEventDateTimeFilter, ::File.join(__dir__, "square/types/loyalty_event_date_time_filter")
    autoload :LoyaltyEventLocationFilter, ::File.join(__dir__, "square/types/loyalty_event_location_filter")
    autoload :LoyaltyEventLoyaltyAccountFilter, ::File.join(__dir__, "square/types/loyalty_event_loyalty_account_filter")
    autoload :LoyaltyEventOrderFilter, ::File.join(__dir__, "square/types/loyalty_event_order_filter")
    autoload :LoyaltyEventTypeFilter, ::File.join(__dir__, "square/types/loyalty_event_type_filter")
    autoload :LoyaltyEventFilter, ::File.join(__dir__, "square/types/loyalty_event_filter")
    autoload :LoyaltyEventQuery, ::File.join(__dir__, "square/types/loyalty_event_query")
    autoload :LoyaltyProgramCreatedEventObject, ::File.join(__dir__, "square/types/loyalty_program_created_event_object")
    autoload :LoyaltyProgramCreatedEventData, ::File.join(__dir__, "square/types/loyalty_program_created_event_data")
    autoload :LoyaltyProgramCreatedEvent, ::File.join(__dir__, "square/types/loyalty_program_created_event")
    autoload :LoyaltyProgramUpdatedEventObject, ::File.join(__dir__, "square/types/loyalty_program_updated_event_object")
    autoload :LoyaltyProgramUpdatedEventData, ::File.join(__dir__, "square/types/loyalty_program_updated_event_data")
    autoload :LoyaltyProgramUpdatedEvent, ::File.join(__dir__, "square/types/loyalty_program_updated_event")
    autoload :LoyaltyPromotionCreatedEventObject, ::File.join(__dir__, "square/types/loyalty_promotion_created_event_object")
    autoload :LoyaltyPromotionCreatedEventData, ::File.join(__dir__, "square/types/loyalty_promotion_created_event_data")
    autoload :LoyaltyPromotionCreatedEvent, ::File.join(__dir__, "square/types/loyalty_promotion_created_event")
    autoload :LoyaltyPromotionUpdatedEventObject, ::File.join(__dir__, "square/types/loyalty_promotion_updated_event_object")
    autoload :LoyaltyPromotionUpdatedEventData, ::File.join(__dir__, "square/types/loyalty_promotion_updated_event_data")
    autoload :LoyaltyPromotionUpdatedEvent, ::File.join(__dir__, "square/types/loyalty_promotion_updated_event")
    autoload :MerchantCustomAttributeDefinitionOwnedCreatedEvent, ::File.join(__dir__, "square/types/merchant_custom_attribute_definition_owned_created_event")
    autoload :MerchantCustomAttributeDefinitionOwnedDeletedEvent, ::File.join(__dir__, "square/types/merchant_custom_attribute_definition_owned_deleted_event")
    autoload :MerchantCustomAttributeDefinitionOwnedUpdatedEvent, ::File.join(__dir__, "square/types/merchant_custom_attribute_definition_owned_updated_event")
    autoload :MerchantCustomAttributeDefinitionVisibleCreatedEvent, ::File.join(__dir__, "square/types/merchant_custom_attribute_definition_visible_created_event")
    autoload :MerchantCustomAttributeDefinitionVisibleDeletedEvent, ::File.join(__dir__, "square/types/merchant_custom_attribute_definition_visible_deleted_event")
    autoload :MerchantCustomAttributeDefinitionVisibleUpdatedEvent, ::File.join(__dir__, "square/types/merchant_custom_attribute_definition_visible_updated_event")
    autoload :MerchantCustomAttributeOwnedDeletedEvent, ::File.join(__dir__, "square/types/merchant_custom_attribute_owned_deleted_event")
    autoload :MerchantCustomAttributeOwnedUpdatedEvent, ::File.join(__dir__, "square/types/merchant_custom_attribute_owned_updated_event")
    autoload :MerchantCustomAttributeVisibleDeletedEvent, ::File.join(__dir__, "square/types/merchant_custom_attribute_visible_deleted_event")
    autoload :MerchantCustomAttributeVisibleUpdatedEvent, ::File.join(__dir__, "square/types/merchant_custom_attribute_visible_updated_event")
    autoload :MerchantSettingsUpdatedEventObject, ::File.join(__dir__, "square/types/merchant_settings_updated_event_object")
    autoload :MerchantSettingsUpdatedEventData, ::File.join(__dir__, "square/types/merchant_settings_updated_event_data")
    autoload :MerchantSettingsUpdatedEvent, ::File.join(__dir__, "square/types/merchant_settings_updated_event")
    autoload :OauthAuthorizationRevokedEventRevokerType, ::File.join(__dir__, "square/types/oauth_authorization_revoked_event_revoker_type")
    autoload :OauthAuthorizationRevokedEventRevocationObject, ::File.join(__dir__, "square/types/oauth_authorization_revoked_event_revocation_object")
    autoload :OauthAuthorizationRevokedEventObject, ::File.join(__dir__, "square/types/oauth_authorization_revoked_event_object")
    autoload :OauthAuthorizationRevokedEventData, ::File.join(__dir__, "square/types/oauth_authorization_revoked_event_data")
    autoload :OauthAuthorizationRevokedEvent, ::File.join(__dir__, "square/types/oauth_authorization_revoked_event")
    autoload :ObtainTokenResponse, ::File.join(__dir__, "square/types/obtain_token_response")
    autoload :OrderCardSurchargeTreatmentType, ::File.join(__dir__, "square/types/order_card_surcharge_treatment_type")
    autoload :OrderCreated, ::File.join(__dir__, "square/types/order_created")
    autoload :OrderCreatedObject, ::File.join(__dir__, "square/types/order_created_object")
    autoload :OrderCreatedEventData, ::File.join(__dir__, "square/types/order_created_event_data")
    autoload :OrderCreatedEvent, ::File.join(__dir__, "square/types/order_created_event")
    autoload :OrderCustomAttributeDefinitionOwnedCreatedEvent, ::File.join(__dir__, "square/types/order_custom_attribute_definition_owned_created_event")
    autoload :OrderCustomAttributeDefinitionOwnedDeletedEvent, ::File.join(__dir__, "square/types/order_custom_attribute_definition_owned_deleted_event")
    autoload :OrderCustomAttributeDefinitionOwnedUpdatedEvent, ::File.join(__dir__, "square/types/order_custom_attribute_definition_owned_updated_event")
    autoload :OrderCustomAttributeDefinitionVisibleCreatedEvent, ::File.join(__dir__, "square/types/order_custom_attribute_definition_visible_created_event")
    autoload :OrderCustomAttributeDefinitionVisibleDeletedEvent, ::File.join(__dir__, "square/types/order_custom_attribute_definition_visible_deleted_event")
    autoload :OrderCustomAttributeDefinitionVisibleUpdatedEvent, ::File.join(__dir__, "square/types/order_custom_attribute_definition_visible_updated_event")
    autoload :OrderCustomAttributeOwnedDeletedEvent, ::File.join(__dir__, "square/types/order_custom_attribute_owned_deleted_event")
    autoload :OrderCustomAttributeOwnedUpdatedEvent, ::File.join(__dir__, "square/types/order_custom_attribute_owned_updated_event")
    autoload :OrderCustomAttributeVisibleDeletedEvent, ::File.join(__dir__, "square/types/order_custom_attribute_visible_deleted_event")
    autoload :OrderCustomAttributeVisibleUpdatedEvent, ::File.join(__dir__, "square/types/order_custom_attribute_visible_updated_event")
    autoload :OrderEntry, ::File.join(__dir__, "square/types/order_entry")
    autoload :OrderFulfillmentDeliveryDetailsScheduleType, ::File.join(__dir__, "square/types/order_fulfillment_delivery_details_schedule_type")
    autoload :OrderFulfillmentFulfillmentLineItemApplication, ::File.join(__dir__, "square/types/order_fulfillment_fulfillment_line_item_application")
    autoload :OrderFulfillmentPickupDetailsScheduleType, ::File.join(__dir__, "square/types/order_fulfillment_pickup_details_schedule_type")
    autoload :OrderFulfillmentState, ::File.join(__dir__, "square/types/order_fulfillment_state")
    autoload :OrderFulfillmentType, ::File.join(__dir__, "square/types/order_fulfillment_type")
    autoload :OrderFulfillmentUpdatedUpdate, ::File.join(__dir__, "square/types/order_fulfillment_updated_update")
    autoload :OrderFulfillmentUpdated, ::File.join(__dir__, "square/types/order_fulfillment_updated")
    autoload :OrderFulfillmentUpdatedObject, ::File.join(__dir__, "square/types/order_fulfillment_updated_object")
    autoload :OrderFulfillmentUpdatedEventData, ::File.join(__dir__, "square/types/order_fulfillment_updated_event_data")
    autoload :OrderFulfillmentUpdatedEvent, ::File.join(__dir__, "square/types/order_fulfillment_updated_event")
    autoload :OrderUpdated, ::File.join(__dir__, "square/types/order_updated")
    autoload :OrderUpdatedObject, ::File.join(__dir__, "square/types/order_updated_object")
    autoload :OrderUpdatedEventData, ::File.join(__dir__, "square/types/order_updated_event_data")
    autoload :OrderUpdatedEvent, ::File.join(__dir__, "square/types/order_updated_event")
    autoload :PauseSubscriptionResponse, ::File.join(__dir__, "square/types/pause_subscription_response")
    autoload :PayOrderResponse, ::File.join(__dir__, "square/types/pay_order_response")
    autoload :PaymentCreatedEventObject, ::File.join(__dir__, "square/types/payment_created_event_object")
    autoload :PaymentCreatedEventData, ::File.join(__dir__, "square/types/payment_created_event_data")
    autoload :PaymentCreatedEvent, ::File.join(__dir__, "square/types/payment_created_event")
    autoload :PaymentUpdatedEventObject, ::File.join(__dir__, "square/types/payment_updated_event_object")
    autoload :PaymentUpdatedEventData, ::File.join(__dir__, "square/types/payment_updated_event_data")
    autoload :PaymentUpdatedEvent, ::File.join(__dir__, "square/types/payment_updated_event")
    autoload :PayoutFailedEventObject, ::File.join(__dir__, "square/types/payout_failed_event_object")
    autoload :PayoutFailedEventData, ::File.join(__dir__, "square/types/payout_failed_event_data")
    autoload :PayoutFailedEvent, ::File.join(__dir__, "square/types/payout_failed_event")
    autoload :PayoutPaidEventObject, ::File.join(__dir__, "square/types/payout_paid_event_object")
    autoload :PayoutPaidEventData, ::File.join(__dir__, "square/types/payout_paid_event_data")
    autoload :PayoutPaidEvent, ::File.join(__dir__, "square/types/payout_paid_event")
    autoload :PayoutSentEventObject, ::File.join(__dir__, "square/types/payout_sent_event_object")
    autoload :PayoutSentEventData, ::File.join(__dir__, "square/types/payout_sent_event_data")
    autoload :PayoutSentEvent, ::File.join(__dir__, "square/types/payout_sent_event")
    autoload :PhaseInput, ::File.join(__dir__, "square/types/phase_input")
    autoload :PublishInvoiceResponse, ::File.join(__dir__, "square/types/publish_invoice_response")
    autoload :QuickPay, ::File.join(__dir__, "square/types/quick_pay")
    autoload :ReceiveTransferOrderResponse, ::File.join(__dir__, "square/types/receive_transfer_order_response")
    autoload :RedeemLoyaltyRewardResponse, ::File.join(__dir__, "square/types/redeem_loyalty_reward_response")
    autoload :RefundCreatedEventObject, ::File.join(__dir__, "square/types/refund_created_event_object")
    autoload :RefundCreatedEventData, ::File.join(__dir__, "square/types/refund_created_event_data")
    autoload :RefundCreatedEvent, ::File.join(__dir__, "square/types/refund_created_event")
    autoload :RefundPaymentResponse, ::File.join(__dir__, "square/types/refund_payment_response")
    autoload :RefundUpdatedEventObject, ::File.join(__dir__, "square/types/refund_updated_event_object")
    autoload :RefundUpdatedEventData, ::File.join(__dir__, "square/types/refund_updated_event_data")
    autoload :RefundUpdatedEvent, ::File.join(__dir__, "square/types/refund_updated_event")
    autoload :RegisterDomainResponseStatus, ::File.join(__dir__, "square/types/register_domain_response_status")
    autoload :RegisterDomainResponse, ::File.join(__dir__, "square/types/register_domain_response")
    autoload :RemoveGroupFromCustomerResponse, ::File.join(__dir__, "square/types/remove_group_from_customer_response")
    autoload :RestoreInventoryAdjustmentReasonResponse, ::File.join(__dir__, "square/types/restore_inventory_adjustment_reason_response")
    autoload :ResumeSubscriptionResponse, ::File.join(__dir__, "square/types/resume_subscription_response")
    autoload :RetrieveBookingCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/retrieve_booking_custom_attribute_definition_response")
    autoload :RetrieveBookingCustomAttributeResponse, ::File.join(__dir__, "square/types/retrieve_booking_custom_attribute_response")
    autoload :GetBusinessBookingProfileResponse, ::File.join(__dir__, "square/types/get_business_booking_profile_response")
    autoload :GetCardResponse, ::File.join(__dir__, "square/types/get_card_response")
    autoload :GetCashDrawerShiftResponse, ::File.join(__dir__, "square/types/get_cash_drawer_shift_response")
    autoload :GetCatalogObjectResponse, ::File.join(__dir__, "square/types/get_catalog_object_response")
    autoload :GetCustomerCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/get_customer_custom_attribute_definition_response")
    autoload :GetCustomerCustomAttributeResponse, ::File.join(__dir__, "square/types/get_customer_custom_attribute_response")
    autoload :GetCustomerGroupResponse, ::File.join(__dir__, "square/types/get_customer_group_response")
    autoload :GetCustomerSegmentResponse, ::File.join(__dir__, "square/types/get_customer_segment_response")
    autoload :GetDisputeEvidenceResponse, ::File.join(__dir__, "square/types/get_dispute_evidence_response")
    autoload :GetDisputeResponse, ::File.join(__dir__, "square/types/get_dispute_response")
    autoload :GetEmployeeResponse, ::File.join(__dir__, "square/types/get_employee_response")
    autoload :GetGiftCardFromGanResponse, ::File.join(__dir__, "square/types/get_gift_card_from_gan_response")
    autoload :GetGiftCardFromNonceResponse, ::File.join(__dir__, "square/types/get_gift_card_from_nonce_response")
    autoload :GetGiftCardResponse, ::File.join(__dir__, "square/types/get_gift_card_response")
    autoload :RetrieveInventoryAdjustmentReasonResponse, ::File.join(__dir__, "square/types/retrieve_inventory_adjustment_reason_response")
    autoload :GetInventoryAdjustmentResponse, ::File.join(__dir__, "square/types/get_inventory_adjustment_response")
    autoload :GetInventoryChangesResponse, ::File.join(__dir__, "square/types/get_inventory_changes_response")
    autoload :GetInventoryCountResponse, ::File.join(__dir__, "square/types/get_inventory_count_response")
    autoload :GetInventoryPhysicalCountResponse, ::File.join(__dir__, "square/types/get_inventory_physical_count_response")
    autoload :RetrieveJobResponse, ::File.join(__dir__, "square/types/retrieve_job_response")
    autoload :RetrieveLocationBookingProfileResponse, ::File.join(__dir__, "square/types/retrieve_location_booking_profile_response")
    autoload :RetrieveLocationCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/retrieve_location_custom_attribute_definition_response")
    autoload :RetrieveLocationCustomAttributeResponse, ::File.join(__dir__, "square/types/retrieve_location_custom_attribute_response")
    autoload :GetLocationResponse, ::File.join(__dir__, "square/types/get_location_response")
    autoload :RetrieveLocationSettingsResponse, ::File.join(__dir__, "square/types/retrieve_location_settings_response")
    autoload :GetLoyaltyAccountResponse, ::File.join(__dir__, "square/types/get_loyalty_account_response")
    autoload :GetLoyaltyProgramResponse, ::File.join(__dir__, "square/types/get_loyalty_program_response")
    autoload :GetLoyaltyPromotionResponse, ::File.join(__dir__, "square/types/get_loyalty_promotion_response")
    autoload :GetLoyaltyRewardResponse, ::File.join(__dir__, "square/types/get_loyalty_reward_response")
    autoload :RetrieveMerchantCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/retrieve_merchant_custom_attribute_definition_response")
    autoload :RetrieveMerchantCustomAttributeResponse, ::File.join(__dir__, "square/types/retrieve_merchant_custom_attribute_response")
    autoload :GetMerchantResponse, ::File.join(__dir__, "square/types/get_merchant_response")
    autoload :RetrieveMerchantSettingsResponse, ::File.join(__dir__, "square/types/retrieve_merchant_settings_response")
    autoload :RetrieveOrderCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/retrieve_order_custom_attribute_definition_response")
    autoload :RetrieveOrderCustomAttributeResponse, ::File.join(__dir__, "square/types/retrieve_order_custom_attribute_response")
    autoload :GetOrderResponse, ::File.join(__dir__, "square/types/get_order_response")
    autoload :GetPaymentLinkResponse, ::File.join(__dir__, "square/types/get_payment_link_response")
    autoload :RetrieveScheduledShiftResponse, ::File.join(__dir__, "square/types/retrieve_scheduled_shift_response")
    autoload :Snippet, ::File.join(__dir__, "square/types/snippet")
    autoload :GetSnippetResponse, ::File.join(__dir__, "square/types/get_snippet_response")
    autoload :GetSubscriptionResponse, ::File.join(__dir__, "square/types/get_subscription_response")
    autoload :GetTeamMemberResponse, ::File.join(__dir__, "square/types/get_team_member_response")
    autoload :RetrieveTimecardResponse, ::File.join(__dir__, "square/types/retrieve_timecard_response")
    autoload :RetrieveTokenStatusResponse, ::File.join(__dir__, "square/types/retrieve_token_status_response")
    autoload :GetTransactionResponse, ::File.join(__dir__, "square/types/get_transaction_response")
    autoload :RetrieveTransferOrderResponse, ::File.join(__dir__, "square/types/retrieve_transfer_order_response")
    autoload :GetWageSettingResponse, ::File.join(__dir__, "square/types/get_wage_setting_response")
    autoload :GetWebhookSubscriptionResponse, ::File.join(__dir__, "square/types/get_webhook_subscription_response")
    autoload :RevokeTokenResponse, ::File.join(__dir__, "square/types/revoke_token_response")
    autoload :ScheduledShiftFilterAssignmentStatus, ::File.join(__dir__, "square/types/scheduled_shift_filter_assignment_status")
    autoload :ScheduledShiftFilterScheduledShiftStatus, ::File.join(__dir__, "square/types/scheduled_shift_filter_scheduled_shift_status")
    autoload :ScheduledShiftWorkdayMatcher, ::File.join(__dir__, "square/types/scheduled_shift_workday_matcher")
    autoload :ScheduledShiftWorkday, ::File.join(__dir__, "square/types/scheduled_shift_workday")
    autoload :ScheduledShiftFilter, ::File.join(__dir__, "square/types/scheduled_shift_filter")
    autoload :ScheduledShiftNotificationAudience, ::File.join(__dir__, "square/types/scheduled_shift_notification_audience")
    autoload :ScheduledShiftSortField, ::File.join(__dir__, "square/types/scheduled_shift_sort_field")
    autoload :ScheduledShiftSort, ::File.join(__dir__, "square/types/scheduled_shift_sort")
    autoload :ScheduledShiftQuery, ::File.join(__dir__, "square/types/scheduled_shift_query")
    autoload :SegmentFilter, ::File.join(__dir__, "square/types/segment_filter")
    autoload :SearchAvailabilityFilter, ::File.join(__dir__, "square/types/search_availability_filter")
    autoload :SearchAvailabilityQuery, ::File.join(__dir__, "square/types/search_availability_query")
    autoload :SearchAvailabilityResponse, ::File.join(__dir__, "square/types/search_availability_response")
    autoload :SearchCatalogItemsRequestStockLevel, ::File.join(__dir__, "square/types/search_catalog_items_request_stock_level")
    autoload :SearchCatalogItemsResponse, ::File.join(__dir__, "square/types/search_catalog_items_response")
    autoload :SearchCatalogObjectsResponse, ::File.join(__dir__, "square/types/search_catalog_objects_response")
    autoload :SearchCustomersResponse, ::File.join(__dir__, "square/types/search_customers_response")
    autoload :SearchEventsFilter, ::File.join(__dir__, "square/types/search_events_filter")
    autoload :SearchEventsSortField, ::File.join(__dir__, "square/types/search_events_sort_field")
    autoload :SearchEventsSort, ::File.join(__dir__, "square/types/search_events_sort")
    autoload :SearchEventsQuery, ::File.join(__dir__, "square/types/search_events_query")
    autoload :SearchEventsResponse, ::File.join(__dir__, "square/types/search_events_response")
    autoload :SearchInvoicesResponse, ::File.join(__dir__, "square/types/search_invoices_response")
    autoload :SearchLoyaltyAccountsRequestLoyaltyAccountQuery, ::File.join(__dir__, "square/types/search_loyalty_accounts_request_loyalty_account_query")
    autoload :SearchLoyaltyAccountsResponse, ::File.join(__dir__, "square/types/search_loyalty_accounts_response")
    autoload :SearchLoyaltyEventsResponse, ::File.join(__dir__, "square/types/search_loyalty_events_response")
    autoload :SearchLoyaltyRewardsRequestLoyaltyRewardQuery, ::File.join(__dir__, "square/types/search_loyalty_rewards_request_loyalty_reward_query")
    autoload :SearchLoyaltyRewardsResponse, ::File.join(__dir__, "square/types/search_loyalty_rewards_response")
    autoload :SearchOrdersCustomerFilter, ::File.join(__dir__, "square/types/search_orders_customer_filter")
    autoload :SearchOrdersDateTimeFilter, ::File.join(__dir__, "square/types/search_orders_date_time_filter")
    autoload :SearchOrdersFulfillmentFilter, ::File.join(__dir__, "square/types/search_orders_fulfillment_filter")
    autoload :SearchOrdersSourceFilter, ::File.join(__dir__, "square/types/search_orders_source_filter")
    autoload :SearchOrdersStateFilter, ::File.join(__dir__, "square/types/search_orders_state_filter")
    autoload :SearchOrdersFilter, ::File.join(__dir__, "square/types/search_orders_filter")
    autoload :SearchOrdersSortField, ::File.join(__dir__, "square/types/search_orders_sort_field")
    autoload :SearchOrdersSort, ::File.join(__dir__, "square/types/search_orders_sort")
    autoload :SearchOrdersQuery, ::File.join(__dir__, "square/types/search_orders_query")
    autoload :SearchOrdersResponse, ::File.join(__dir__, "square/types/search_orders_response")
    autoload :SearchScheduledShiftsResponse, ::File.join(__dir__, "square/types/search_scheduled_shifts_response")
    autoload :SearchShiftsResponse, ::File.join(__dir__, "square/types/search_shifts_response")
    autoload :SearchSubscriptionsFilter, ::File.join(__dir__, "square/types/search_subscriptions_filter")
    autoload :SearchSubscriptionsQuery, ::File.join(__dir__, "square/types/search_subscriptions_query")
    autoload :SearchSubscriptionsResponse, ::File.join(__dir__, "square/types/search_subscriptions_response")
    autoload :SearchTeamMembersFilter, ::File.join(__dir__, "square/types/search_team_members_filter")
    autoload :SearchTeamMembersQuery, ::File.join(__dir__, "square/types/search_team_members_query")
    autoload :SearchTeamMembersResponse, ::File.join(__dir__, "square/types/search_team_members_response")
    autoload :SearchTerminalActionsResponse, ::File.join(__dir__, "square/types/search_terminal_actions_response")
    autoload :SearchTerminalCheckoutsResponse, ::File.join(__dir__, "square/types/search_terminal_checkouts_response")
    autoload :SearchTerminalRefundsResponse, ::File.join(__dir__, "square/types/search_terminal_refunds_response")
    autoload :SearchTimecardsResponse, ::File.join(__dir__, "square/types/search_timecards_response")
    autoload :SearchTransferOrdersResponse, ::File.join(__dir__, "square/types/search_transfer_orders_response")
    autoload :SearchVendorsRequestFilter, ::File.join(__dir__, "square/types/search_vendors_request_filter")
    autoload :SearchVendorsRequestSortField, ::File.join(__dir__, "square/types/search_vendors_request_sort_field")
    autoload :SearchVendorsRequestSort, ::File.join(__dir__, "square/types/search_vendors_request_sort")
    autoload :SearchVendorsResponse, ::File.join(__dir__, "square/types/search_vendors_response")
    autoload :ShiftFilterStatus, ::File.join(__dir__, "square/types/shift_filter_status")
    autoload :ShiftWorkdayMatcher, ::File.join(__dir__, "square/types/shift_workday_matcher")
    autoload :ShiftWorkday, ::File.join(__dir__, "square/types/shift_workday")
    autoload :ShiftFilter, ::File.join(__dir__, "square/types/shift_filter")
    autoload :ShiftSortField, ::File.join(__dir__, "square/types/shift_sort_field")
    autoload :ShiftSort, ::File.join(__dir__, "square/types/shift_sort")
    autoload :ShiftQuery, ::File.join(__dir__, "square/types/shift_query")
    autoload :StartTransferOrderResponse, ::File.join(__dir__, "square/types/start_transfer_order_response")
    autoload :SubmitEvidenceResponse, ::File.join(__dir__, "square/types/submit_evidence_response")
    autoload :SubscriptionCreatedEventObject, ::File.join(__dir__, "square/types/subscription_created_event_object")
    autoload :SubscriptionCreatedEventData, ::File.join(__dir__, "square/types/subscription_created_event_data")
    autoload :SubscriptionCreatedEvent, ::File.join(__dir__, "square/types/subscription_created_event")
    autoload :SubscriptionTestResult, ::File.join(__dir__, "square/types/subscription_test_result")
    autoload :SubscriptionUpdatedEventObject, ::File.join(__dir__, "square/types/subscription_updated_event_object")
    autoload :SubscriptionUpdatedEventData, ::File.join(__dir__, "square/types/subscription_updated_event_data")
    autoload :SubscriptionUpdatedEvent, ::File.join(__dir__, "square/types/subscription_updated_event")
    autoload :SwapPlanResponse, ::File.join(__dir__, "square/types/swap_plan_response")
    autoload :TeamMemberCreatedEventObject, ::File.join(__dir__, "square/types/team_member_created_event_object")
    autoload :TeamMemberCreatedEventData, ::File.join(__dir__, "square/types/team_member_created_event_data")
    autoload :TeamMemberCreatedEvent, ::File.join(__dir__, "square/types/team_member_created_event")
    autoload :TeamMemberInvitationStatus, ::File.join(__dir__, "square/types/team_member_invitation_status")
    autoload :TeamMemberUpdatedEventObject, ::File.join(__dir__, "square/types/team_member_updated_event_object")
    autoload :TeamMemberUpdatedEventData, ::File.join(__dir__, "square/types/team_member_updated_event_data")
    autoload :TeamMemberUpdatedEvent, ::File.join(__dir__, "square/types/team_member_updated_event")
    autoload :TeamMemberWageSettingUpdatedEventObject, ::File.join(__dir__, "square/types/team_member_wage_setting_updated_event_object")
    autoload :TeamMemberWageSettingUpdatedEventData, ::File.join(__dir__, "square/types/team_member_wage_setting_updated_event_data")
    autoload :TeamMemberWageSettingUpdatedEvent, ::File.join(__dir__, "square/types/team_member_wage_setting_updated_event")
    autoload :TerminalActionCreatedEventObject, ::File.join(__dir__, "square/types/terminal_action_created_event_object")
    autoload :TerminalActionCreatedEventData, ::File.join(__dir__, "square/types/terminal_action_created_event_data")
    autoload :TerminalActionCreatedEvent, ::File.join(__dir__, "square/types/terminal_action_created_event")
    autoload :TerminalActionQueryFilter, ::File.join(__dir__, "square/types/terminal_action_query_filter")
    autoload :TerminalActionQuerySort, ::File.join(__dir__, "square/types/terminal_action_query_sort")
    autoload :TerminalActionQuery, ::File.join(__dir__, "square/types/terminal_action_query")
    autoload :TerminalActionUpdatedEventObject, ::File.join(__dir__, "square/types/terminal_action_updated_event_object")
    autoload :TerminalActionUpdatedEventData, ::File.join(__dir__, "square/types/terminal_action_updated_event_data")
    autoload :TerminalActionUpdatedEvent, ::File.join(__dir__, "square/types/terminal_action_updated_event")
    autoload :TerminalCheckoutCreatedEventObject, ::File.join(__dir__, "square/types/terminal_checkout_created_event_object")
    autoload :TerminalCheckoutCreatedEventData, ::File.join(__dir__, "square/types/terminal_checkout_created_event_data")
    autoload :TerminalCheckoutCreatedEvent, ::File.join(__dir__, "square/types/terminal_checkout_created_event")
    autoload :TerminalCheckoutQueryFilter, ::File.join(__dir__, "square/types/terminal_checkout_query_filter")
    autoload :TerminalCheckoutQuerySort, ::File.join(__dir__, "square/types/terminal_checkout_query_sort")
    autoload :TerminalCheckoutQuery, ::File.join(__dir__, "square/types/terminal_checkout_query")
    autoload :TerminalCheckoutUpdatedEventObject, ::File.join(__dir__, "square/types/terminal_checkout_updated_event_object")
    autoload :TerminalCheckoutUpdatedEventData, ::File.join(__dir__, "square/types/terminal_checkout_updated_event_data")
    autoload :TerminalCheckoutUpdatedEvent, ::File.join(__dir__, "square/types/terminal_checkout_updated_event")
    autoload :TerminalRefundCreatedEventObject, ::File.join(__dir__, "square/types/terminal_refund_created_event_object")
    autoload :TerminalRefundCreatedEventData, ::File.join(__dir__, "square/types/terminal_refund_created_event_data")
    autoload :TerminalRefundCreatedEvent, ::File.join(__dir__, "square/types/terminal_refund_created_event")
    autoload :TerminalRefundQueryFilter, ::File.join(__dir__, "square/types/terminal_refund_query_filter")
    autoload :TerminalRefundQuerySort, ::File.join(__dir__, "square/types/terminal_refund_query_sort")
    autoload :TerminalRefundQuery, ::File.join(__dir__, "square/types/terminal_refund_query")
    autoload :TerminalRefundUpdatedEventObject, ::File.join(__dir__, "square/types/terminal_refund_updated_event_object")
    autoload :TerminalRefundUpdatedEventData, ::File.join(__dir__, "square/types/terminal_refund_updated_event_data")
    autoload :TerminalRefundUpdatedEvent, ::File.join(__dir__, "square/types/terminal_refund_updated_event")
    autoload :TestWebhookSubscriptionResponse, ::File.join(__dir__, "square/types/test_webhook_subscription_response")
    autoload :TimecardFilterStatus, ::File.join(__dir__, "square/types/timecard_filter_status")
    autoload :TimecardWorkdayMatcher, ::File.join(__dir__, "square/types/timecard_workday_matcher")
    autoload :TimecardWorkday, ::File.join(__dir__, "square/types/timecard_workday")
    autoload :TimecardFilter, ::File.join(__dir__, "square/types/timecard_filter")
    autoload :TimecardSortField, ::File.join(__dir__, "square/types/timecard_sort_field")
    autoload :TimecardSort, ::File.join(__dir__, "square/types/timecard_sort")
    autoload :TimecardQuery, ::File.join(__dir__, "square/types/timecard_query")
    autoload :TransactionType, ::File.join(__dir__, "square/types/transaction_type")
    autoload :TransferOrderCreatedEventObject, ::File.join(__dir__, "square/types/transfer_order_created_event_object")
    autoload :TransferOrderCreatedEventData, ::File.join(__dir__, "square/types/transfer_order_created_event_data")
    autoload :TransferOrderCreatedEvent, ::File.join(__dir__, "square/types/transfer_order_created_event")
    autoload :TransferOrderDeletedEventData, ::File.join(__dir__, "square/types/transfer_order_deleted_event_data")
    autoload :TransferOrderDeletedEvent, ::File.join(__dir__, "square/types/transfer_order_deleted_event")
    autoload :TransferOrderFilter, ::File.join(__dir__, "square/types/transfer_order_filter")
    autoload :TransferOrderGoodsReceiptLineItem, ::File.join(__dir__, "square/types/transfer_order_goods_receipt_line_item")
    autoload :TransferOrderGoodsReceipt, ::File.join(__dir__, "square/types/transfer_order_goods_receipt")
    autoload :TransferOrderSortField, ::File.join(__dir__, "square/types/transfer_order_sort_field")
    autoload :TransferOrderSort, ::File.join(__dir__, "square/types/transfer_order_sort")
    autoload :TransferOrderQuery, ::File.join(__dir__, "square/types/transfer_order_query")
    autoload :TransferOrderUpdatedEventObject, ::File.join(__dir__, "square/types/transfer_order_updated_event_object")
    autoload :TransferOrderUpdatedEventData, ::File.join(__dir__, "square/types/transfer_order_updated_event_data")
    autoload :TransferOrderUpdatedEvent, ::File.join(__dir__, "square/types/transfer_order_updated_event")
    autoload :UnlinkCustomerFromGiftCardResponse, ::File.join(__dir__, "square/types/unlink_customer_from_gift_card_response")
    autoload :UpdateBookingCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/update_booking_custom_attribute_definition_response")
    autoload :UpdateBookingResponse, ::File.join(__dir__, "square/types/update_booking_response")
    autoload :UpdateBreakTypeResponse, ::File.join(__dir__, "square/types/update_break_type_response")
    autoload :UpdateCatalogImageRequest, ::File.join(__dir__, "square/types/update_catalog_image_request")
    autoload :UpdateCatalogImageResponse, ::File.join(__dir__, "square/types/update_catalog_image_response")
    autoload :UpdateCustomerCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/update_customer_custom_attribute_definition_response")
    autoload :UpdateCustomerGroupResponse, ::File.join(__dir__, "square/types/update_customer_group_response")
    autoload :UpdateInventoryAdjustmentReasonResponse, ::File.join(__dir__, "square/types/update_inventory_adjustment_reason_response")
    autoload :UpdateInventoryAdjustmentResponse, ::File.join(__dir__, "square/types/update_inventory_adjustment_response")
    autoload :UpdateInvoiceResponse, ::File.join(__dir__, "square/types/update_invoice_response")
    autoload :UpdateItemModifierListsResponse, ::File.join(__dir__, "square/types/update_item_modifier_lists_response")
    autoload :UpdateItemTaxesResponse, ::File.join(__dir__, "square/types/update_item_taxes_response")
    autoload :UpdateJobResponse, ::File.join(__dir__, "square/types/update_job_response")
    autoload :UpdateLocationCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/update_location_custom_attribute_definition_response")
    autoload :UpdateLocationResponse, ::File.join(__dir__, "square/types/update_location_response")
    autoload :UpdateLocationSettingsResponse, ::File.join(__dir__, "square/types/update_location_settings_response")
    autoload :UpdateMerchantCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/update_merchant_custom_attribute_definition_response")
    autoload :UpdateMerchantSettingsResponse, ::File.join(__dir__, "square/types/update_merchant_settings_response")
    autoload :UpdateOrderCustomAttributeDefinitionResponse, ::File.join(__dir__, "square/types/update_order_custom_attribute_definition_response")
    autoload :UpdateOrderResponse, ::File.join(__dir__, "square/types/update_order_response")
    autoload :UpdatePaymentLinkResponse, ::File.join(__dir__, "square/types/update_payment_link_response")
    autoload :UpdatePaymentResponse, ::File.join(__dir__, "square/types/update_payment_response")
    autoload :UpdateScheduledShiftResponse, ::File.join(__dir__, "square/types/update_scheduled_shift_response")
    autoload :UpdateShiftResponse, ::File.join(__dir__, "square/types/update_shift_response")
    autoload :UpdateSubscriptionResponse, ::File.join(__dir__, "square/types/update_subscription_response")
    autoload :UpdateTeamMemberRequest, ::File.join(__dir__, "square/types/update_team_member_request")
    autoload :UpdateTimecardResponse, ::File.join(__dir__, "square/types/update_timecard_response")
    autoload :UpdateTransferOrderLineData, ::File.join(__dir__, "square/types/update_transfer_order_line_data")
    autoload :UpdateTransferOrderData, ::File.join(__dir__, "square/types/update_transfer_order_data")
    autoload :UpdateTransferOrderResponse, ::File.join(__dir__, "square/types/update_transfer_order_response")
    autoload :UpdateVendorRequest, ::File.join(__dir__, "square/types/update_vendor_request")
    autoload :UpdateWageSettingResponse, ::File.join(__dir__, "square/types/update_wage_setting_response")
    autoload :UpdateWebhookSubscriptionResponse, ::File.join(__dir__, "square/types/update_webhook_subscription_response")
    autoload :UpdateWebhookSubscriptionSignatureKeyResponse, ::File.join(__dir__, "square/types/update_webhook_subscription_signature_key_response")
    autoload :UpdateWorkweekConfigResponse, ::File.join(__dir__, "square/types/update_workweek_config_response")
    autoload :UpsertBookingCustomAttributeResponse, ::File.join(__dir__, "square/types/upsert_booking_custom_attribute_response")
    autoload :UpsertCatalogObjectResponse, ::File.join(__dir__, "square/types/upsert_catalog_object_response")
    autoload :UpsertCustomerCustomAttributeResponse, ::File.join(__dir__, "square/types/upsert_customer_custom_attribute_response")
    autoload :UpsertLocationCustomAttributeResponse, ::File.join(__dir__, "square/types/upsert_location_custom_attribute_response")
    autoload :UpsertMerchantCustomAttributeResponse, ::File.join(__dir__, "square/types/upsert_merchant_custom_attribute_response")
    autoload :UpsertSnippetResponse, ::File.join(__dir__, "square/types/upsert_snippet_response")
    autoload :V1Money, ::File.join(__dir__, "square/types/v_1_money")
    autoload :V1OrderHistoryEntryAction, ::File.join(__dir__, "square/types/v_1_order_history_entry_action")
    autoload :V1OrderHistoryEntry, ::File.join(__dir__, "square/types/v_1_order_history_entry")
    autoload :V1OrderState, ::File.join(__dir__, "square/types/v_1_order_state")
    autoload :V1TenderCardBrand, ::File.join(__dir__, "square/types/v_1_tender_card_brand")
    autoload :V1TenderEntryMethod, ::File.join(__dir__, "square/types/v_1_tender_entry_method")
    autoload :V1TenderType, ::File.join(__dir__, "square/types/v_1_tender_type")
    autoload :V1Tender, ::File.join(__dir__, "square/types/v_1_tender")
    autoload :V1Order, ::File.join(__dir__, "square/types/v_1_order")
    autoload :V1UpdateOrderRequestAction, ::File.join(__dir__, "square/types/v_1_update_order_request_action")
    autoload :VendorCreatedEventObjectOperation, ::File.join(__dir__, "square/types/vendor_created_event_object_operation")
    autoload :VendorCreatedEventObject, ::File.join(__dir__, "square/types/vendor_created_event_object")
    autoload :VendorCreatedEventData, ::File.join(__dir__, "square/types/vendor_created_event_data")
    autoload :VendorCreatedEvent, ::File.join(__dir__, "square/types/vendor_created_event")
    autoload :VendorUpdatedEventObjectOperation, ::File.join(__dir__, "square/types/vendor_updated_event_object_operation")
    autoload :VendorUpdatedEventObject, ::File.join(__dir__, "square/types/vendor_updated_event_object")
    autoload :VendorUpdatedEventData, ::File.join(__dir__, "square/types/vendor_updated_event_data")
    autoload :VendorUpdatedEvent, ::File.join(__dir__, "square/types/vendor_updated_event")
    autoload :VisibilityFilter, ::File.join(__dir__, "square/types/visibility_filter")
    autoload :GetLoyaltyAccountRequest, ::File.join(__dir__, "square/types/get_loyalty_account_request")
    autoload :GetLoyaltyProgramRequest, ::File.join(__dir__, "square/types/get_loyalty_program_request")
    autoload :GetLoyaltyPromotionRequest, ::File.join(__dir__, "square/types/get_loyalty_promotion_request")
    autoload :GetLoyaltyRewardRequest, ::File.join(__dir__, "square/types/get_loyalty_reward_request")
    autoload :GetCardRequest, ::File.join(__dir__, "square/types/get_card_request")
    autoload :GetDisputeEvidenceRequest, ::File.join(__dir__, "square/types/get_dispute_evidence_request")
    autoload :GetDisputeRequest, ::File.join(__dir__, "square/types/get_dispute_request")
    autoload :V1GetPaymentRequest, ::File.join(__dir__, "square/types/v_1_get_payment_request")
    autoload :V1GetSettlementRequest, ::File.join(__dir__, "square/types/v_1_get_settlement_request")
    autoload :GetCustomerGroupRequest, ::File.join(__dir__, "square/types/get_customer_group_request")
    autoload :GetCustomerRequest, ::File.join(__dir__, "square/types/get_customer_request")
    autoload :GetCustomerSegmentRequest, ::File.join(__dir__, "square/types/get_customer_segment_request")
    autoload :GetTransactionRequest, ::File.join(__dir__, "square/types/get_transaction_request")
    autoload :GetBookingRequest, ::File.join(__dir__, "square/types/get_booking_request")
    autoload :GetBusinessBookingProfileRequest, ::File.join(__dir__, "square/types/get_business_booking_profile_request")
    autoload :GetTeamMemberBookingProfileRequest, ::File.join(__dir__, "square/types/get_team_member_booking_profile_request")
    autoload :GetSnippetRequest, ::File.join(__dir__, "square/types/get_snippet_request")
    autoload :GetInventoryAdjustmentRequest, ::File.join(__dir__, "square/types/get_inventory_adjustment_request")
    autoload :GetInventoryPhysicalCountRequest, ::File.join(__dir__, "square/types/get_inventory_physical_count_request")
    autoload :GetInventoryTransferRequest, ::File.join(__dir__, "square/types/get_inventory_transfer_request")
    autoload :GetInventoryTransferResponse, ::File.join(__dir__, "square/types/get_inventory_transfer_response")
    autoload :GetVendorRequest, ::File.join(__dir__, "square/types/get_vendor_request")
    autoload :GetPaymentLinkRequest, ::File.join(__dir__, "square/types/get_payment_link_request")
    autoload :GetGiftCardRequest, ::File.join(__dir__, "square/types/get_gift_card_request")
    autoload :GetOrderRequest, ::File.join(__dir__, "square/types/get_order_request")
    autoload :GetEmployeeRequest, ::File.join(__dir__, "square/types/get_employee_request")
    autoload :GetLocationRequest, ::File.join(__dir__, "square/types/get_location_request")
    autoload :GetMerchantRequest, ::File.join(__dir__, "square/types/get_merchant_request")
    autoload :GetTeamMemberRequest, ::File.join(__dir__, "square/types/get_team_member_request")
    autoload :GetWageSettingRequest, ::File.join(__dir__, "square/types/get_wage_setting_request")
    autoload :GetWebhookSubscriptionRequest, ::File.join(__dir__, "square/types/get_webhook_subscription_request")
    autoload :CubeJoin, ::File.join(__dir__, "square/types/cube_join")
    autoload :Segment, ::File.join(__dir__, "square/types/segment")
    autoload :DimensionGranularity, ::File.join(__dir__, "square/types/dimension_granularity")
    autoload :DimensionOrder, ::File.join(__dir__, "square/types/dimension_order")
    autoload :SimpleFormat, ::File.join(__dir__, "square/types/simple_format")
    autoload :LinkFormat, ::File.join(__dir__, "square/types/link_format")
    autoload :CustomTimeFormat, ::File.join(__dir__, "square/types/custom_time_format")
    autoload :CustomNumericFormat, ::File.join(__dir__, "square/types/custom_numeric_format")
    autoload :Format, ::File.join(__dir__, "square/types/format")
    autoload :FormatDescription, ::File.join(__dir__, "square/types/format_description")
    autoload :Dimension, ::File.join(__dir__, "square/types/dimension")
    autoload :Measure, ::File.join(__dir__, "square/types/measure")
    autoload :Folder, ::File.join(__dir__, "square/types/folder")
    autoload :NestedFolder, ::File.join(__dir__, "square/types/nested_folder")
    autoload :Hierarchy, ::File.join(__dir__, "square/types/hierarchy")
    autoload :CubeType, ::File.join(__dir__, "square/types/cube_type")
    autoload :Cube, ::File.join(__dir__, "square/types/cube")
    autoload :MetadataResponse, ::File.join(__dir__, "square/types/metadata_response")
    autoload :LoadResultAnnotation, ::File.join(__dir__, "square/types/load_result_annotation")
    autoload :LoadResultDataRow, ::File.join(__dir__, "square/types/load_result_data_row")
    autoload :LoadResultDataCompact, ::File.join(__dir__, "square/types/load_result_data_compact")
    autoload :LoadResultDataColumnar, ::File.join(__dir__, "square/types/load_result_data_columnar")
    autoload :LoadResultData, ::File.join(__dir__, "square/types/load_result_data")
    autoload :ReportingError, ::File.join(__dir__, "square/types/reporting_error")
    autoload :LoadResponse, ::File.join(__dir__, "square/types/load_response")
    autoload :QueryFilterAnd, ::File.join(__dir__, "square/types/query_filter_and")
    autoload :QueryFilterOr, ::File.join(__dir__, "square/types/query_filter_or")
    autoload :QueryFilterCondition, ::File.join(__dir__, "square/types/query_filter_condition")
    autoload :TimeDimensionDateRange, ::File.join(__dir__, "square/types/time_dimension_date_range")
    autoload :TimeDimension, ::File.join(__dir__, "square/types/time_dimension")
    autoload :QueryFilter, ::File.join(__dir__, "square/types/query_filter")
    autoload :JoinSubquery, ::File.join(__dir__, "square/types/join_subquery")
    autoload :JoinHint, ::File.join(__dir__, "square/types/join_hint")
    autoload :Query, ::File.join(__dir__, "square/types/query")
    autoload :CacheMode, ::File.join(__dir__, "square/types/cache_mode")
  end
end
