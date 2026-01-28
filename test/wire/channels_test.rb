# frozen_string_literal: true

require_relative "wiremock_test_case"

class ChannelsWireTest < WireMockTestCase
  def setup
    super

    @client = Square::Client.new(
      token: "<token>",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_channels_list_with_wiremock
    test_id = "channels.list.0"

    result = @client.channels.list(
      reference_type: "UNKNOWN_TYPE",
      reference_id: "reference_id",
      status: "ACTIVE",
      cursor: "cursor",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "channels.list.0"
        }
      }
    )

    result.pages.next_page

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/channels",
      query_params: nil,
      expected: 1
    )
  end

  def test_channels_bulk_retrieve_with_wiremock
    test_id = "channels.bulk_retrieve.0"

    @client.channels.bulk_retrieve(
      channel_ids: %w[CH_9C03D0B59 CH_6X139B5MN NOT_EXISTING],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "channels.bulk_retrieve.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/v2/channels/bulk-retrieve",
      query_params: nil,
      expected: 1
    )
  end

  def test_channels_get_with_wiremock
    test_id = "channels.get.0"

    @client.channels.get(
      channel_id: "channel_id",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "channels.get.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/v2/channels/channel_id",
      query_params: nil,
      expected: 1
    )
  end
end
