require_relative './helpers'
require_relative './integration_test_base'

class CustomerSegmentsTest < IntegrationTestBase
  def setup
    setup_class
  end

  def test_should_list_customer_segments
    response = @client.customers.segments.list

    refute_nil response.data
    assert response.data.length > 0
  end

  def test_should_retrieve_a_customer_segment
    list_response = @client.customers.segments.list
    segment_id = list_response.data.first.id

    response = @client.customers.segments.get(segment_id: segment_id)

    refute_nil response.segment
    refute_nil response.segment.name
  end
end
