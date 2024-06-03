require 'date'
require 'json'

require 'apimatic_core_interfaces'
require 'apimatic_core'
require 'apimatic_faraday_client_adapter'

require_relative 'square/api_helper'
require_relative 'square/client'

# Utilities
require_relative 'square/utilities/file_wrapper'
require_relative 'square/utilities/date_time_helper'

# Http
require_relative 'square/http/api_response'
require_relative 'square/http/http_call_back'
require_relative 'square/http/http_method_enum'
require_relative 'square/http/http_request'
require_relative 'square/http/http_response'

# Logger
require_relative 'square/http/auth/o_auth2'

# Models

# Exceptions
require_relative 'square/exceptions/api_exception'

require_relative 'square/configuration'

# Controllers
require_relative 'square/api/base_api'
require_relative 'square/api/mobile_authorization_api'
require_relative 'square/api/o_auth_api'
require_relative 'square/api/v1_transactions_api'
require_relative 'square/api/apple_pay_api'
require_relative 'square/api/bank_accounts_api'
require_relative 'square/api/bookings_api'
require_relative 'square/api/booking_custom_attributes_api'
require_relative 'square/api/cards_api'
require_relative 'square/api/cash_drawers_api'
require_relative 'square/api/catalog_api'
require_relative 'square/api/customers_api'
require_relative 'square/api/customer_custom_attributes_api'
require_relative 'square/api/customer_groups_api'
require_relative 'square/api/customer_segments_api'
require_relative 'square/api/devices_api'
require_relative 'square/api/disputes_api'
require_relative 'square/api/employees_api'
require_relative 'square/api/events_api'
require_relative 'square/api/gift_cards_api'
require_relative 'square/api/gift_card_activities_api'
require_relative 'square/api/inventory_api'
require_relative 'square/api/invoices_api'
require_relative 'square/api/labor_api'
require_relative 'square/api/locations_api'
require_relative 'square/api/location_custom_attributes_api'
require_relative 'square/api/checkout_api'
require_relative 'square/api/transactions_api'
require_relative 'square/api/loyalty_api'
require_relative 'square/api/merchants_api'
require_relative 'square/api/merchant_custom_attributes_api'
require_relative 'square/api/orders_api'
require_relative 'square/api/order_custom_attributes_api'
require_relative 'square/api/payments_api'
require_relative 'square/api/payouts_api'
require_relative 'square/api/refunds_api'
require_relative 'square/api/sites_api'
require_relative 'square/api/snippets_api'
require_relative 'square/api/subscriptions_api'
require_relative 'square/api/team_api'
require_relative 'square/api/terminal_api'
require_relative 'square/api/vendors_api'
require_relative 'square/api/webhook_subscriptions_api'
require_relative 'square/utilities/webhooks_helper'
