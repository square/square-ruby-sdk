# frozen_string_literal: true

require_relative "../../test_helper"

describe Square::Refunds::Client do
  before do
    # Create payment for testing refunds
    payment_response = client.payments.create(
      source_id: "cnon:card-nonce-ok",
      idempotency_key: SecureRandom.uuid,
      amount_money: Square::Payments::Types::Money.new(
        amount: 200,
        currency: "USD"
      ),
      app_fee_money: Square::Payments::Types::Money.new(
        amount: 10,
        currency: "USD"
      ),
      autocomplete: true
    )
    @payment_id = payment_response.payment.id

    # Create initial refund for testing
    refund_response = client.refunds.refund_payment(
      idempotency_key: SecureRandom.uuid,
      payment_id: @payment_id,
      amount_money: Square::Refunds::Types::Money.new(
        amount: 200,
        currency: "USD"
      )
    )
    @refund_id = refund_response.refund.id
  end

  describe "#list" do
    it "should list payment refunds" do
      skip "Skipping for now."
      _request = {}

      puts "request #{_request}" if verbose?

      response = client.refunds.list
      refute_nil response.data
      assert response.data.length > 0

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#refund_payment" do
    it "should refund payment" do
      skip "Skipping for now."
      # Create new payment to refund
      payment_response = client.payments.create(
        source_id: "cnon:card-nonce-ok",
        idempotency_key: SecureRandom.uuid,
        amount_money: Square::Payments::Types::Money.new(
          amount: 200,
          currency: "USD"
        ),
        app_fee_money: Square::Payments::Types::Money.new(
          amount: 10,
          currency: "USD"
        ),
        autocomplete: true
      )

      _request = {
        idempotency_key: SecureRandom.uuid,
        payment_id: payment_response.payment.id,
        amount_money: Square::Refunds::Types::Money.new(
          amount: 200,
          currency: "USD"
        )
      }

      puts "request #{_request.to_h}" if verbose?

      response = client.refunds.refund_payment(
        idempotency_key: _request[:idempotency_key],
        payment_id: _request[:payment_id],
        amount_money: _request[:amount_money]
      )
      refute_nil response.refund
      assert_equal payment_response.payment.id, response.refund.payment_id

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#get" do
    it "should get payment refund" do
      skip "Skipping for now."
      _request = { refund_id: @refund_id }

      puts "request #{_request}" if verbose?

      response = client.refunds.get(refund_id: @refund_id)
      refute_nil response.refund
      assert_equal @refund_id, response.refund.id
      assert_equal @payment_id, response.refund.payment_id

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#get with invalid id" do
    it "should handle invalid refund id" do
      skip "Skipping for now."
      _request = { refund_id: "invalid-id" }

      puts "request #{_request}" if verbose?

      assert_raises(Square::SquareError) do
        client.refunds.get(refund_id: "invalid-id")
      end
    end
  end
end