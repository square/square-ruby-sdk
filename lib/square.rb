

Dir[File.join(__dir__, 'square/internal/http/**/*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'square/internal/json/**/*.rb')].each { |file| require file }

require_relative 'square/internal/types/model/field'
require_relative 'square/internal/types/type'
require_relative 'square/internal/types/model'
require_relative 'square/internal/types/utils'
require_relative 'square/internal/types/union'

Dir[File.join(__dir__, 'square/internal/types/**/*.rb')].each { |file| require file }
Dir[File.join(__dir__, 'square/internal/**/*.rb')].each { |file| require file }


require_relative 'square/types/error_code'
require_relative 'square/types/error_category'
require_relative 'square/types/error'
require_relative 'square/types/currency'
require_relative 'square/types/money'
require_relative 'square/types/card_brand'
require_relative 'square/types/dispute_reason'
require_relative 'square/types/dispute_state'
require_relative 'square/types/disputed_payment'
require_relative 'square/types/dispute'
require_relative 'square/types/processing_fee'
require_relative 'square/types/country'
require_relative 'square/types/address'
require_relative 'square/types/card_type'
require_relative 'square/types/card_prepaid_type'
require_relative 'square/types/card_co_brand'
require_relative 'square/types/card'
require_relative 'square/types/card_payment_details'
require_relative 'square/types/payment'
require_relative 'square/types/refund'
require_relative 'square/types/refund_status'
require_relative 'square/types/refund_type'


Dir[File.join(__dir__, 'square/types/**/*.rb')].each { |file| require file }

Dir[File.join(__dir__, 'square/**/*.rb')].each { |file| require file }