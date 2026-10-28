# frozen_string_literal: true

require "custom/test_helper"
require "square/webhooks_helper"

# Offline unit tests for the custom webhook signature helper
# (Square::WebhooksHelper.verify_signature). The vectors match the legacy
# SquareLegacy::WebhooksHelper tests so both helpers stay interchangeable.
class WebhooksHelperTest < Minitest::Test
  REQUEST_BODY = '{"merchant_id":"MLEFBHHSJGVHD","type":"webhooks.test_notification","event_id":"ac3ac95b-f97d-458c-a6e6-18981597e05f","created_at":"2022-07-13T20:30:59.037339943Z","data":{"type":"webhooks","id":"bc368e64-01aa-407e-b46e-3231809b1129"}}'
  SIGNATURE_HEADER = "GF4YkrJgGBDZ9NIYbNXBnMzqb2HoL4RW/S6vkZ9/2N4="
  SIGNATURE_KEY = "Ibxx_5AKakO-3qeNVR61Dw"
  NOTIFICATION_URL = "https://webhook.site/679a4f3a-dcfa-49ee-bac5-9d0edad886b9"

  def verify(**overrides)
    Square::WebhooksHelper.verify_signature(
      request_body: REQUEST_BODY,
      signature_header: SIGNATURE_HEADER,
      signature_key: SIGNATURE_KEY,
      notification_url: NOTIFICATION_URL,
      **overrides
    )
  end

  def test_valid_signature
    assert verify
  end

  def test_valid_signature_with_escaped_characters
    assert verify(
      request_body: '{"data":{"type":"webhooks","id":">id<"}}',
      signature_header: "Cxt7+aTi4rKgcA0bC4g9EHdVtLSDWdqccmL5MvihU4U=",
      signature_key: "signature-key",
      notification_url: "https://webhook.site/webhooks"
    )
  end

  def test_valid_signature_with_binary_encoded_body
    assert verify(request_body: REQUEST_BODY.b)
  end

  def test_invalid_on_notification_url_mismatch
    refute verify(notification_url: "https://webhook.site/79a4f3a-dcfa-49ee-bac5-9d0edad886b9")
  end

  def test_invalid_on_signature_key_mismatch
    refute verify(signature_key: "MCmhFRxGX82xMwg5FsaoQA")
  end

  def test_invalid_on_signature_header_mismatch
    refute verify(signature_header: "1z2n3DEJJiUPKcPzQo1ftvbxGdw=")
  end

  def test_invalid_on_request_body_mismatch
    refute verify(request_body: REQUEST_BODY.sub("2022-07-13", "2022-06-13"))
  end

  def test_invalid_on_reformatted_request_body
    refute verify(request_body: JSON.pretty_generate(JSON.parse(REQUEST_BODY)))
  end

  def test_invalid_on_nil_request_body
    refute verify(request_body: nil)
  end

  def test_invalid_on_missing_signature_header
    refute verify(signature_header: nil)
    refute verify(signature_header: "")
  end

  def test_raises_on_missing_signature_key
    assert_raises(ArgumentError) { verify(signature_key: nil) }
    assert_raises(ArgumentError) { verify(signature_key: "") }
  end

  def test_raises_on_missing_notification_url
    assert_raises(ArgumentError) { verify(notification_url: nil) }
    assert_raises(ArgumentError) { verify(notification_url: "") }
  end
end
