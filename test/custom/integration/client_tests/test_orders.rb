# frozen_string_literal: true

require "custom/test_helper"

describe Square::Orders::Client do
  before do
    @location_id = client.locations.list.locations.first.id

    _create_request = Square::Types::CreateOrderRequest.new(
      idempotency_key: SecureRandom.uuid,
      order: Square::Types::Order.new(
        location_id: @location_id,
        line_items: [
          Square::Types::OrderLineItem.new(
            name: "New Item",
            quantity: "1",
            base_price_money: Square::Types::Money.new(
              amount: 0,
              currency: "USD"
            )
          )
        ]
      )
    )
    # Create initial order for testing
    order_response = client.orders.create(**_create_request.to_h)
    refute_nil order_response
    assert_equal order_response.class, Square::Types::CreateOrderResponse
    refute_nil order_response.order
    assert_equal @location_id, order_response.order.location_id
    assert_equal "New Item", order_response.order.line_items.first.name

    @order_id = order_response.order.id
    @order = order_response.order
    @line_item_uid = order_response.order.line_items.first.uid
  end

  describe "#create" do
    it "should create order" do
      _request = Square::Types::CreateOrderRequest.new(
        idempotency_key: SecureRandom.uuid,
        order: Square::Types::Order.new(
          location_id: @location_id,
          line_items: [
            Square::Types::OrderLineItem.new(
              name: "New Item",
              quantity: "1",
              base_price_money: Square::Types::Money.new(
                amount: 100,
                currency: "USD"
              )
            )
          ]
        )
      )

      puts "request #{_request.to_h}" if verbose?

      response = client.orders.create(**_request.to_h)
      refute_nil response.order
      assert_equal response.class, Square::Types::CreateOrderResponse
      assert_equal @location_id, response.order.location_id
      assert_equal "New Item", response.order.line_items.first.name

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#batch_get" do
    it "should batch retrieve orders" do
      _request = Square::Orders::Types::BatchGetOrdersRequest.new(
        order_ids: [@order_id]
      )

      response = client.orders.batch_get(**_request.to_h)
      refute_nil response
      assert_equal response.class, Square::Types::BatchGetOrdersResponse
      refute_nil response.orders
      assert_equal @order_id, response.orders.first.id

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#search" do
    it "should search orders" do
      _request = Square::Orders::Types::SearchOrdersRequest.new(
        limit: 1,
        location_ids: [@location_id]
      )

      response = client.orders.search(**_request.to_h)
      refute_nil response
      assert_equal response.class, Square::Types::SearchOrdersResponse
      refute_nil response.orders
      assert response.orders.length > 0

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#update" do
    it "should update order" do
      _request = Square::Orders::Types::UpdateOrderRequest.new(
        order_id: @order_id,
        idempotency_key: SecureRandom.uuid,
        order: Square::Types::Order.new(
          version: 1,
          location_id: @location_id,
          line_items: [
            Square::Types::OrderLineItem.new(
              name: "Updated Item",
              quantity: "1",
              base_price_money: Square::Types::Money.new(
                amount: 0,
                currency: "USD"
              ),
              note: nil
            )
          ]
        ),
        fields_to_clear: ["line_items[#{@line_item_uid}]"]
      )

      response = client.orders.update(**_request.to_h)
      refute_nil response.order
      assert_equal @order_id, response.order.id
      assert_equal "Updated Item", response.order.line_items.first.name

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#pay" do
    it "should pay order" do
      _request = Square::Orders::Types::PayOrderRequest.new(
        order_id: @order_id,
        idempotency_key: SecureRandom.uuid,
        order_version: @order.version,
        payment_ids: []
      )

      response = client.orders.pay(**_request.to_h)
      refute_nil response.order
      assert_equal @order_id, response.order.id

      puts "response #{response.to_h}" if verbose?
    end
  end

  describe "#calculate" do
    it "should calculate order" do
      _request = Square::Orders::Types::CalculateOrderRequest.new(
        order: Square::Types::Order.new(
          location_id: @location_id,
          line_items: [
            Square::Types::OrderLineItem.new(
              name: "New Item",
              quantity: "1",
              base_price_money: Square::Types::Money.new(
                amount: 100,
                currency: "USD"
              )
            )
          ]
        )
      )

      response = client.orders.calculate(**_request.to_h)
      refute_nil response.order
      refute_nil response.order.total_money
      assert_equal response.class, Square::Types::CalculateOrderResponse

      puts "response #{response.to_h}" if verbose?
    end
  end
end