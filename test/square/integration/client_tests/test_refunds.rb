# frozen_string_literal: true

require "test_helper"

describe Square::Refunds::Client do
  before do
    skip "Skipping for now."
    # Create payment for testing refunds
    _create_request = Square::Payments::Types::CreatePaymentRequest.new(  
      source_id: "cnon:card-nonce-ok",
      idempotency_key: SecureRandom.uuid,
      amount_money: Square::Payments::Types::Money.new(
        amount: 200,
        currency: "USD"
      )
    )
    payment_response = client.payments.create(**_create_request.to_h)
    refute_nil payment_response
    assert_equal payment_response.class, Square::Types::CreatePaymentResponse
    refute_nil payment_response.payment
    assert_equal "cnon:card-nonce-ok", payment_response.payment.source_id
    assert_equal 200, payment_response.payment.amount_money.amount
    assert_equal "USD", payment_response.payment.amount_money.currency
    @payment_id = payment_response.payment.id

    # Create initial refund for testing
    refund_response = client.refunds.refund_payment(**_refund_request.to_h)
    refute_nil refund_response
    assert_equal refund_response.class, Square::Types::RefundPaymentResponse
    refute_nil refund_response.refund
    assert_equal @payment_id, refund_response.refund.payment_id
    assert_equal 200, refund_response.refund.amount_money.amount
    assert_equal "USD", refund_response.refund.amount_money.currency
    @refund_id = refund_response.refund.id
  end

  describe "#list" do
    it "should list payment refunds" do
      skip "Skipping for now."
      _request = {}

      puts "request #{_request.to_h}" if verbose?

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
      _create_request = Square::Payments::Types::CreatePaymentRequest.new(
        source_id: "cnon:card-nonce-ok",
        idempotency_key: SecureRandom.uuid,
        amount_money: Square::Refunds::Types::Money.new(
          amount: 200,
          currency: "USD"
        ),
        app_fee_money: Square::Payments::Types::Money.new(
          amount: 10,
          currency: "USD"
        ),
        autocomplete: true
      )
      payment_response = client.payments.create(**_create_request.to_h)
      refute_nil payment_response
      assert_equal payment_response.class, Square::Types::CreatePaymentResponse
      refute_nil payment_response.payment
      assert_equal "cnon:card-nonce-ok", payment_response.payment.source_id
      assert_equal 200, payment_response.payment.amount_money.amount
      assert_equal "USD", payment_response.payment.amount_money.currency
      @payment_id = payment_response.payment.id

      _refund_request = Square::Refunds::Types::RefundPaymentRequest.new(
        idempotency_key: SecureRandom.uuid,
        payment_id: payment_response.payment.id,
        amount_money: Square::Refunds::Types::Money.new(
          amount: 200,
          currency: "USD"
        )
      )

      response = client.refunds.refund_payment(**_refund_request.to_h)
      refute_nil response
      assert_equal response.class, Square::Types::RefundPaymentResponse
      refute_nil response.refund
      assert_equal @payment_id, response.refund.payment_id
      assert_equal 200, response.refund.amount_money.amount
      assert_equal "USD", response.refund.amount_money.currency

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#get" do
    it "should get payment refund" do
      skip "Skipping for now."
      _request = Square::Refunds::Types::GetRefundsRequest.new(
        refund_id: @refund_id
      )

      puts "request #{_request.to_h}" if verbose?

      response = client.refunds.get(**_request.to_h)
      refute_nil response.refund
      assert_equal response.class, Square::Types::GetRefundResponse
      assert_equal @refund_id, response.refund.id
      assert_equal @payment_id, response.refund.payment_id

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#get with invalid id" do
    it "should handle invalid refund id" do
      skip "Skipping for now."
      _request = Square::Refunds::Types::GetRefundsRequest.new(
        refund_id: "invalid-id"
      )

      puts "request #{_request.to_h}" if verbose?

      assert_raises(StandardError) do
        client.refunds.get(**_request.to_h)
      end
    end
  end
end