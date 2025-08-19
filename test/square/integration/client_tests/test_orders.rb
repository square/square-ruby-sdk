# frozen_string_literal: true

require_relative "../../test_helper"

describe Square::Orders::Client do
  before do
    @location_id = client.locations.list.locations.first.id

    # Create initial order for testing
    order_response = client.orders.create(
      idempotency_key: SecureRandom.uuid,
      order: Square::Orders::Types::Order.new(
        location_id: @location_id,
        line_items: [
          Square::Orders::Types::OrderLineItem.new(
            name: "New Item",
            quantity: "1",
            base_price_money: Square::Orders::Types::Money.new(
              amount: 100,
              currency: "USD"
            )
          )
        ]
      )
    )
    @order_id = order_response.order.id
    @line_item_uid = order_response.order.line_items.first.uid
  end

  describe "#create" do
    it "should create order" do
      skip "Skipping for now."
      _request = {
        idempotency_key: SecureRandom.uuid,
        order: Square::Orders::Types::Order.new(
          location_id: @location_id,
          line_items: [
            Square::Orders::Types::OrderLineItem.new(
              name: "New Item",
              quantity: "1",
              base_price_money: Square::Orders::Types::Money.new(
                amount: 100,
                currency: "USD"
              )
            )
          ]
        )
      }

      puts "request #{_request.to_h}" if verbose?

      response = client.orders.create(
        idempotency_key: _request[:idempotency_key],
        order: _request[:order]
      )
      refute_nil response.order
      assert_equal @location_id, response.order.location_id
      assert_equal "New Item", response.order.line_items.first.name

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#batch_get" do
    it "should batch retrieve orders" do
      skip "Skipping for now."
      _request = { order_ids: [@order_id] }

      puts "request #{_request}" if verbose?

      response = client.orders.batch_get(order_ids: [@order_id])
      refute_nil response.orders
      assert_equal @order_id, response.orders.first.id

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#search" do
    it "should search orders" do
      skip "Skipping for now."
      _request = {
        limit: 1,
        location_ids: [@location_id]
      }

      puts "request #{_request}" if verbose?

      response = client.orders.search(
        limit: 1,
        location_ids: [@location_id]
      )
      refute_nil response.orders
      assert response.orders.length > 0

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#update" do
    it "should update order" do
      skip "Skipping for now."
      _request = {
        order_id: @order_id,
        idempotency_key: SecureRandom.uuid,
        order: Square::Orders::Types::Order.new(
          version: 1,
          location_id: @location_id,
          line_items: [
            Square::Orders::Types::OrderLineItem.new(
              name: "Updated Item",
              quantity: "1",
              base_price_money: Square::Orders::Types::Money.new(
                amount: 0,
                currency: "USD"
              ),
              note: nil
            )
          ]
        ),
        fields_to_clear: ["line_items[#{@line_item_uid}]"]
      }

      puts "request #{_request.to_h}" if verbose?

      response = client.orders.update(
        order_id: _request[:order_id],
        idempotency_key: _request[:idempotency_key],
        order: _request[:order],
        fields_to_clear: _request[:fields_to_clear]
      )
      refute_nil response.order
      assert_equal @order_id, response.order.id
      assert_equal "Updated Item", response.order.line_items.first.name

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#pay" do
    it "should pay order" do
      skip "Skipping for now."
      _request = {
        order_id: @order_id,
        idempotency_key: SecureRandom.uuid,
        order_version: 2,
        payment_ids: []
      }

      puts "request #{_request}" if verbose?

      response = client.orders.pay(
        order_id: _request[:order_id],
        idempotency_key: _request[:idempotency_key],
        order_version: _request[:order_version],
        payment_ids: _request[:payment_ids]
      )
      refute_nil response.order
      assert_equal @order_id, response.order.id

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#calculate" do
    it "should calculate order" do
      skip "Skipping for now."
      _request = {
        order: Square::Orders::Types::Order.new(
          location_id: @location_id,
          line_items: [
            Square::Orders::Types::OrderLineItem.new(
              name: "New Item",
              quantity: "1",
              base_price_money: Square::Orders::Types::Money.new(
                amount: 100,
                currency: "USD"
              )
            )
          ]
        )
      }

      puts "request #{_request.to_h}" if verbose?

      response = client.orders.calculate(order: _request[:order])
      refute_nil response.order
      refute_nil response.order.total_money

      puts "response #{response.to_h}" if verbose?
    end
  end
end