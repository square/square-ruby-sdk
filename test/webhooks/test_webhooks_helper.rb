require_relative '../../lib/square/utilities/webhooks_helper.rb'
require 'minitest/autorun'
require 'minitest/hell'
require 'minitest/pride'
require 'minitest/proveit'
require 'logger'

class WebhooksHelperTest < Minitest::Test
  # Called only once for the class before any test has executed
  def setup
    @logger = Logger.new(STDOUT) # Create a Logger instance for logging
    @logger.level = Logger::INFO # Set the log level to INFO or any desired level
    @request_body = '{"merchant_id":"MLEFBHHSJGVHD","type":"webhooks.test_notification","event_id":"ac3ac95b-f97d-458c-a6e6-18981597e05f","created_at":"2022-07-13T20:30:59.037339943Z","data":{"type":"webhooks","id":"bc368e64-01aa-407e-b46e-3231809b1129"}}'
    @signature_header = 'GF4YkrJgGBDZ9NIYbNXBnMzqb2HoL4RW/S6vkZ9/2N4='
    @signature_key = 'Ibxx_5AKakO-3qeNVR61Dw'
    @notification_url = 'https://webhook.site/679a4f3a-dcfa-49ee-bac5-9d0edad886b9'
  end

  def test_signature_validation_pass
    @logger.info('Running test_signature_validation_pass') # Log a message
    is_valid = Square::WebhooksHelper.is_valid_webhook_event_signature(
      @request_body,
      @signature_header,
      @signature_key,
      @notification_url
    )
    assert_equal true, is_valid
  end

  def test_signature_validation_escaped_pass
    @logger.info('Running test_signature_validation_pass') # Log a message
    
    escpaedRequestBody = '{"data":{"type":"webhooks","id":">id<"}}';
    newSignatureHeader = "Cxt7+aTi4rKgcA0bC4g9EHdVtLSDWdqccmL5MvihU4U=";
    signatureKey = "signature-key";
    url = "https://webhook.site/webhooks";

    is_valid = Square::WebhooksHelper.is_valid_webhook_event_signature(
      escpaedRequestBody,
      newSignatureHeader,
      signatureKey,
      url
    )
    assert_equal true, is_valid
  end

  def test_signature_validation_fails_on_notification_url_mismatch
    @logger.info('Running test_signature_validation_fails_on_notification_url_mismatch') # Log a message
    is_valid = Square::WebhooksHelper.is_valid_webhook_event_signature(
      @request_body,
      @signature_header,
      @signature_key,
      'https://webhook.site/79a4f3a-dcfa-49ee-bac5-9d0edad886b9'
    )
    assert_equal false, is_valid
  end

  def test_signature_validation_fails_on_invalid_signature_key
    @logger.info('Running test_signature_validation_fails_on_invalid_signature_key') # Log a message
    is_valid = Square::WebhooksHelper.is_valid_webhook_event_signature(
      @request_body,
      @signature_header,
      'MCmhFRxGX82xMwg5FsaoQA',
      @notification_url
    )
    assert_equal false, is_valid
  end

  def test_signature_validation_fails_on_invalid_signature_header
    is_valid = Square::WebhooksHelper.is_valid_webhook_event_signature(
      @request_body,
      '1z2n3DEJJiUPKcPzQo1ftvbxGdw=',
      @signature_key,
      @notification_url
    )
    assert_equal false, is_valid
  end

  def test_signature_validation_fails_on_request_body_mismatch
    request_body = '{"merchant_id":"MLEFBHHSJGVHD","type":"webhooks.test_notification","event_id":"ac3ac95b-f97d-458c-a6e6-18981597e05f","created_at":"2022-06-13T20:30:59.037339943Z","data":{"type":"webhooks","id":"bc368e64-01aa-407e-b46e-3231809b1129"}}'
    is_valid = Square::WebhooksHelper.is_valid_webhook_event_signature(
      request_body,
      @signature_header,
      @signature_key,
      @notification_url
    )
    assert_equal false, is_valid
  end

  def test_signature_validation_fails_on_request_body_formatted
    request_body = '{
            "merchant_id": "MLEFBHHSJGVHD",
            "type": "webhooks.test_notification",
            "event_id": "ac3ac95b-f97d-458c-a6e6-18981597e05f",
            "created_at": "2022-07-13T20:30:59.037339943Z",
            "data": {
                "type": "webhooks",
                "id": "bc368e64-01aa-407e-b46e-3231809b1129"
            }
        }'
    is_valid = Square::WebhooksHelper.is_valid_webhook_event_signature(
      request_body,
      @signature_header,
      @signature_key,
      @notification_url
    )
    assert_equal false, is_valid
  end

  def test_throws_error_on_empty_signature_key
    assert_raises(RuntimeError, 'signature_key is null or empty') do
      Square::WebhooksHelper.is_valid_webhook_event_signature(
        @request_body,
        @signature_header,
        '',
        @notification_url
      )
    end
  end

  def test_throws_error_on_signature_key_not_configured
    assert_raises(RuntimeError) do
      Square::WebhooksHelper.is_valid_webhook_event_signature(
        @request_body,
        @signature_header,
        nil,
        @notification_url
      )
    end
  end

  def test_throws_error_on_empty_notification_url
    assert_raises(RuntimeError, 'notification_url is null or empty') do
      Square::WebhooksHelper.is_valid_webhook_event_signature(
        @request_body,
        @signature_header,
        @signature_key,
        ''
      )
    end
  end

  def test_throws_error_on_notification_url_not_configured
    assert_raises(RuntimeError) do
      Square::WebhooksHelper.is_valid_webhook_event_signature(
        @request_body,
        @signature_header,
        @signature_key,
        nil
      )
    end
  end
end
