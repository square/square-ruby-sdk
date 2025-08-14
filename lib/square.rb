require_relative 'square/environment'
require_relative 'square/client'

# Types
Dir[File.join(__dir__, 'square/**/types/**/*.rb')].each { |file| require file unless file.include?('/internal/') }

# All client files (main clients and sub-clients)
Dir[File.join(__dir__, 'square/**/client.rb')].each { |file| require file }


# # Internal types and utilities
# Dir[File.join(__dir__, 'square/internal/types/**/*.rb')].each { |file| require file }
# Dir[File.join(__dir__, 'square/internal/errors/**/*.rb')].each { |file| require file }
# Dir[File.join(__dir__, 'square/internal/http/**/*.rb')].each { |file| require file }
# Dir[File.join(__dir__, 'square/internal/json/**/*.rb')].each { |file| require file }
# Dir[File.join(__dir__, 'square/internal/multipart/**/*.rb')].each { |file| require file }

# module Square
#   # Export all client classes for easy access
#   class << self
#     # Main clients
#     attr_reader :mobile_client, :o_auth_client, :apple_pay_client, :bank_accounts_client,
#                 :bookings_client, :cards_client, :cash_drawers_client, :catalog_client,
#                 :checkout_client, :customers_client, :devices_client, :disputes_client,
#                 :employees_client, :events_client, :gift_cards_client, :inventory_client,
#                 :invoices_client, :labor_client, :locations_client, :loyalty_client,
#                 :merchants_client, :orders_client, :payments_client, :payouts_client,
#                 :refunds_client, :sites_client, :snippets_client, :subscriptions_client,
#                 :team_client, :team_members_client, :terminal_client, :vendors_client,
#                 :v_1_transactions_client, :webhooks_client
#   end
# end
