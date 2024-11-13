require 'openssl'
require 'base64'

module Square
  class WebhooksHelper
    def self.is_valid_webhook_event_signature(request_body, signature_header, signature_key, notification_url)
      return false if request_body.nil?
      raise 'signature_key is null or empty' if signature_key.nil? || signature_key.empty?
      raise 'notification_url is null or empty' if notification_url.nil? || notification_url.empty?

      # Prepare the message as it was signed by the sender
      message = "#{notification_url}#{request_body}"

      # Compute the hash value
      hmac = OpenSSL::HMAC.digest('sha256', signature_key, message)

      # Compare the computed hash vs the value in the signature header
      hash_base64 = Base64.strict_encode64(hmac)
      hash_base64 == signature_header
    end
  end
end
