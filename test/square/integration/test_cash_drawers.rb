require_relative 'helpers'
require_relative 'integration_test_base'


class CashDrawersTest < IntegrationTestBase
  def setup
    setup_class
  end

  def test_list_cash_drawer_shifts
    start_time = Time.now - 3600  # 1 hour ago
    end_time = Time.now
    
    response = @client.cash_drawers.shifts.list(
      location_id: get_default_location_id(@client),
      begin_time: start_time.iso8601,
      end_time: end_time.iso8601
    )

    refute_nil(response)
  end
end
