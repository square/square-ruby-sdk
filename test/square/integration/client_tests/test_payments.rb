# frozen_string_literal: true

require "test_helper"

describe Square::Payments::Client do
  before do
    skip "Skipping for now."
    # Create initial payment for testing
    _create_request = Square::Payments::Types::CreatePaymentRequest.new(
      source_id: "cnon:card-nonce-ok",
      idempotency_key: SecureRandom.uuid,
      amount_money: Square::Payments::Types::Money.new(
        amount: 200,
        currency: "USD"
      ),
    )
    payment_response = client.payments.create(request: _create_request.to_h)
    refute_nil payment_response
    assert_equal payment_response.class, Square::Types::CreatePaymentResponse
    refute_nil payment_response.payment
    assert_equal "cnon:card-nonce-ok", payment_response.payment.source_id
    assert_equal 200, payment_response.payment.amount_money.amount
    assert_equal "USD", payment_response.payment.amount_money.currency
    assert_equal 10, payment_response.payment.app_fee_money.amount
    assert_equal "USD", payment_response.payment.app_fee_money.currency
    @payment_id = payment_response.payment.id
  end

  describe "#list" do
    it "should list payments" do
      skip "Skipping for now."

      response = client.payments.list
      refute_nil response
      assert_equal response.class, Square::Types::ListPaymentsResponse
      refute_nil response.payments
      assert response.payments.length > 0

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#create" do
    it "should create payment" do
      skip "Skipping for now."
      _request = Square::Payments::Types::CreatePaymentRequest.new(
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

      response = client.payments.create(request: _request.to_h)
      refute_nil response
      assert_equal response.class, Square::Types::CreatePaymentResponse
      refute_nil response.payment
      assert_equal 10, response.payment.app_fee_money.amount
      assert_equal "USD", response.payment.app_fee_money.currency
      assert_equal 200, response.payment.amount_money.amount
      assert_equal "USD", response.payment.amount_money.currency

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#get" do
    it "should get payment" do
      skip "Skipping for now."
      _request = Square::Payments::Types::GetPaymentRequest.new(
        payment_id: @payment_id
      )

      response = client.payments.get(request: _request.to_h)
      refute_nil response
      assert_equal response.class, Square::Types::GetPaymentResponse
      refute_nil response.payment
      assert_equal @payment_id, response.payment.id

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#cancel" do
    it "should cancel payment" do
      skip "Skipping for now."
      _request = Square::Payments::Types::CancelPaymentRequest.new(
        payment_id: @payment_id
      )

      response = client.payments.cancel(request: _request.to_h)
      refute_nil response
      assert_equal response.class, Square::Types::CancelPaymentResponse
      refute_nil response.payment
      assert_equal @payment_id, response.payment.id

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#cancel_by_idempotency_key" do
    it "should cancel payment by idempotency key" do
      skip "Skipping for now."
      idempotency_key = SecureRandom.uuid
      _create_request = Square::Payments::Types::CreatePaymentRequest.new(
        source_id: "cnon:card-nonce-ok",
        idempotency_key: idempotency_key,
        amount_money: Square::Payments::Types::Money.new(
          amount: 200,
          currency: "USD"
        ),
      )
      client.payments.create(
        source_id: "cnon:card-nonce-ok",
        idempotency_key: idempotency_key,
        amount_money: Square::Payments::Types::Money.new(
          amount: 200,
          currency: "USD"
        ),
        app_fee_money: Square::Payments::Types::Money.new(
          amount: 10,
          currency: "USD"
        ),
        autocomplete: false
      )

      _request = { idempotency_key: idempotency_key }

      puts "request #{_request.to_h}" if verbose?

      response = client.payments.cancel_by_idempotency_key(idempotency_key: idempotency_key)
      refute_nil response
      assert_equal response.class, Square::Types::CancelPaymentByIdempotencyKeyResponse

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#complete" do
    it "should complete payment" do
      skip "Skipping for now."
      # Create payment to complete
      _create_request = Square::Payments::Types::CreatePaymentRequest.new(
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
        autocomplete: false
      )
      create_response = client.payments.create(request: _create_request.to_h)

      _request = Square::Payments::Types::CompletePaymentRequest.new(
        payment_id: create_response.payment.id
      )

      response = client.payments.complete(request: _request.to_h)
      refute_nil response.payment
      assert_equal "COMPLETED", response.payment.status

      puts "response #{response.to_h}" if verbose?
    end
  end
end