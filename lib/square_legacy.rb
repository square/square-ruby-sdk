require 'date'
require 'json'

require 'apimatic_core_interfaces'
require 'apimatic_core'
require 'apimatic_faraday_client_adapter'

require_relative 'square_legacy/api_helper'
require_relative 'square_legacy/client'

# Utilities
require_relative 'square_legacy/utilities/file_wrapper'
require_relative 'square_legacy/utilities/date_time_helper'

# Http
require_relative 'square_legacy/http/api_response'
require_relative 'square_legacy/http/http_call_back'
require_relative 'square_legacy/http/http_method_enum'
require_relative 'square_legacy/http/http_request'
require_relative 'square_legacy/http/http_response'

# Logger
require_relative 'square_legacy/http/auth/o_auth2'

# Models

# Exceptions
require_relative 'square_legacy/exceptions/api_exception'

require_relative 'square_legacy/configuration'

# Controllers
require_relative 'square_legacy/api/base_api'
require_relative 'square_legacy/api/mobile_authorization_api'
require_relative 'square_legacy/api/o_auth_api'
require_relative 'square_legacy/api/v1_transactions_api'
require_relative 'square_legacy/api/apple_pay_api'
require_relative 'square_legacy/api/bank_accounts_api'
require_relative 'square_legacy/api/bookings_api'
require_relative 'square_legacy/api/booking_custom_attributes_api'
require_relative 'square_legacy/api/cards_api'
require_relative 'square_legacy/api/cash_drawers_api'
require_relative 'square_legacy/api/catalog_api'
require_relative 'square_legacy/api/customers_api'
require_relative 'square_legacy/api/customer_custom_attributes_api'
require_relative 'square_legacy/api/customer_groups_api'
require_relative 'square_legacy/api/customer_segments_api'
require_relative 'square_legacy/api/devices_api'
require_relative 'square_legacy/api/disputes_api'
require_relative 'square_legacy/api/employees_api'
require_relative 'square_legacy/api/events_api'
require_relative 'square_legacy/api/gift_cards_api'
require_relative 'square_legacy/api/gift_card_activities_api'
require_relative 'square_legacy/api/inventory_api'
require_relative 'square_legacy/api/invoices_api'
require_relative 'square_legacy/api/labor_api'
require_relative 'square_legacy/api/locations_api'
require_relative 'square_legacy/api/location_custom_attributes_api'
require_relative 'square_legacy/api/checkout_api'
require_relative 'square_legacy/api/transactions_api'
require_relative 'square_legacy/api/loyalty_api'
require_relative 'square_legacy/api/merchants_api'
require_relative 'square_legacy/api/merchant_custom_attributes_api'
require_relative 'square_legacy/api/orders_api'
require_relative 'square_legacy/api/order_custom_attributes_api'
require_relative 'square_legacy/api/payments_api'
require_relative 'square_legacy/api/payouts_api'
require_relative 'square_legacy/api/refunds_api'
require_relative 'square_legacy/api/sites_api'
require_relative 'square_legacy/api/snippets_api'
require_relative 'square_legacy/api/subscriptions_api'
require_relative 'square_legacy/api/team_api'
require_relative 'square_legacy/api/terminal_api'
require_relative 'square_legacy/api/vendors_api'
require_relative 'square_legacy/api/webhook_subscriptions_api'
require_relative 'square_legacy/utilities/webhooks_helper'
