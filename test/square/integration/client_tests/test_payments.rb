# frozen_string_literal: true

require "test_helper"

describe Square::Payments::Client do
  before do
    skip "Skipping for now."
    # Create initial payment for testing
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
      autocomplete: false
    )
    @payment_id = payment_response.payment.id
  end

  describe "#list" do
    it "should list payments" do
      skip "Skipping for now."
      _request = {}

      puts "request #{_request.to_h}" if verbose?

      response = client.payments.list
      refute_nil response.data
      assert response.data.length > 0

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#create" do
    it "should create payment" do
      skip "Skipping for now."
      _request = {
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
      }

      puts "request #{_request.to_h}" if verbose?

      response = client.payments.create(request: _request.to_h)
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
      _request = { payment_id: @payment_id }

      puts "request #{_request.to_h}" if verbose?

      response = client.payments.get(payment_id: @payment_id)
      refute_nil response.payment
      assert_equal @payment_id, response.payment.id

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#cancel" do
    it "should cancel payment" do
      skip "Skipping for now."
      _request = { payment_id: @payment_id }

      puts "request #{_request.to_h}" if verbose?

      response = client.payments.cancel(payment_id: @payment_id)
      refute_nil response.payment
      assert_equal @payment_id, response.payment.id

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#cancel_by_idempotency_key" do
    it "should cancel payment by idempotency key" do
      skip "Skipping for now."
      idempotency_key = SecureRandom.uuid

      # Create payment to cancel
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

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#complete" do
    it "should complete payment" do
      skip "Skipping for now."
      # Create payment to complete
      create_response = client.payments.create(
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

      _request = { payment_id: create_response.payment.id }

      puts "request #{_request.to_h}" if verbose?

      response = client.payments.complete(payment_id: create_response.payment.id)
      refute_nil response.payment
      assert_equal "COMPLETED", response.payment.status

      puts "response #{response.to_h}" if verbose?
    end
  end
end