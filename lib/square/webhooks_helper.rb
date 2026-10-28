# frozen_string_literal: true

require "base64"
require "openssl"

module Square
  # Custom, +.fernignore+-protected helper for verifying that a webhook event
  # notification was sent by Square.
  #
  # Square signs each notification with HMAC-SHA256 over the notification URL
  # followed by the raw request body, keyed by the subscription's signature key,
  # and sends the Base64-encoded digest in the +x-square-hmacsha256-signature+
  # header. See https://developer.squareup.com/docs/webhooks/step3validate.
  #
  # @example
  #   require "square"
  #   require "square/webhooks_helper"
  #
  #   Square::WebhooksHelper.verify_signature(
  #     request_body: request.raw_post,
  #     signature_header: request.headers["x-square-hmacsha256-signature"],
  #     signature_key: ENV.fetch("SQUARE_WEBHOOK_SIGNATURE_KEY"),
  #     notification_url: "https://example.com/webhooks/square"
  #   )
  class WebhooksHelper
    # Verifies and validates an event notification.
    #
    # @param request_body [String] the raw, unparsed body of the request. Any
    #   re-serialization (for example parsing and regenerating the JSON) changes
    #   the bytes and fails verification.
    # @param signature_header [String, nil] the value of the
    #   +x-square-hmacsha256-signature+ header.
    # @param signature_key [String] the signature key from the Square Developer
    #   Console for the webhook subscription.
    # @param notification_url [String] the notification URL configured for the
    #   webhook subscription, exactly as it appears in the Developer Console.
    # @return [Boolean] +true+ if the signature is valid, indicating that the
    #   event can be trusted as it came from Square; +false+ otherwise, in which
    #   case the event may be malicious and should be discarded.
    # @raise [ArgumentError] if +signature_key+ or +notification_url+ is nil or
    #   empty.
    def self.verify_signature(request_body:, signature_header:, signature_key:, notification_url:)
      return false if request_body.nil?
      raise ArgumentError, "signature_key is nil or empty" if signature_key.nil? || signature_key.empty?
      raise ArgumentError, "notification_url is nil or empty" if notification_url.nil? || notification_url.empty?
      return false if signature_header.nil? || signature_header.empty?

      # Sign raw bytes so the result does not depend on each string's encoding
      # (Rack, for example, hands over request bodies as ASCII-8BIT).
      payload = notification_url.b + request_body.b
      digest = OpenSSL::HMAC.digest("SHA256", signature_key.b, payload)
      expected = Base64.strict_encode64(digest)

      OpenSSL.secure_compare(expected, signature_header)
    end
  end
end
