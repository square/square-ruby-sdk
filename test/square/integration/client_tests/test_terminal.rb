# frozen_string_literal: true

require_relative "../../test_helper"

describe Square::Terminal::Checkouts::Client do
  before do
    @sandbox_device_id = "da40d603-c2ea-4a65-8cfd-f42e36dab0c7"

    # Create terminal checkout for testing
    checkout_response = client.terminal.checkouts.create(
      idempotency_key: SecureRandom.uuid,
      checkout: Square::Terminal::Types::TerminalCheckout.new(
        device_options: Square::Terminal::Types::DeviceCheckoutOptions.new(
          device_id: @sandbox_device_id
        ),
        amount_money: Square::Terminal::Types::Money.new(
          amount: 100,
          currency: "USD"
        )
      )
    )
    @checkout_id = checkout_response.checkout.id
  end

  describe "#create" do
    it "should create terminal checkout" do
      skip "Skipping for now."
      _request = {
        idempotency_key: SecureRandom.uuid,
        checkout: Square::Terminal::Types::TerminalCheckout.new(
          device_options: Square::Terminal::Types::DeviceCheckoutOptions.new(
            device_id: @sandbox_device_id
          ),
          amount_money: Square::Terminal::Types::Money.new(
            amount: 100,
            currency: "USD"
          )
        )
      }

      puts "request #{_request.to_h}" if verbose?

      response = client.terminal.checkouts.create(request: _request.to_h)
      refute_nil response.checkout
      assert_equal @sandbox_device_id, response.checkout.device_options.device_id
      assert_equal 100, response.checkout.amount_money.amount

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#search" do
    it "should search terminal checkouts" do
      skip "Skipping for now."
      _request = { limit: 1 }

      puts "request #{_request.to_h}" if verbose?

      response = client.terminal.checkouts.search(limit: 1)
      refute_nil response.checkouts
      assert response.checkouts.length > 0

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#get" do
    it "should get terminal checkout" do
      skip "Skipping for now."
      _request = { checkout_id: @checkout_id }

      puts "request #{_request.to_h}" if verbose?

      response = client.terminal.checkouts.get(checkout_id: @checkout_id)
      refute_nil response.checkout
      assert_equal @checkout_id, response.checkout.id

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#cancel" do
    it "should cancel terminal checkout" do
      skip "Skipping for now."
      _request = { checkout_id: @checkout_id }

      puts "request #{_request.to_h}" if verbose?

      response = client.terminal.checkouts.cancel(checkout_id: @checkout_id)
      refute_nil response.checkout
      assert_equal "CANCELED", response.checkout.status

      puts "response #{response.to_h}" if verbose?
    end
  end
end