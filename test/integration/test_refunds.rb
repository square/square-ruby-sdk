require_relative './helpers'
require_relative './integration_test_base'

class RefundsTest < IntegrationTestBase
  def setup
    setup_class
    # Create payment for testing refunds
    payment_response = @client.payments.create(
      source_id: "cnon:card-nonce-ok",
      idempotency_key: new_test_uuid,
      amount_money: {
        amount: 200,
        currency: "USD"
      },
      app_fee_money: {
        amount: 10,
        currency: "USD"
      },
      autocomplete: true
    )
    @payment_id = payment_response.payment.id

    # Create initial refund for testing
    refund_response = @client.refunds.refund_payment(
      idempotency_key: new_test_uuid,
      payment_id: @payment_id,
      amount_money: {
        amount: 200,
        currency: "USD"
      }
    )
    @refund_id = refund_response.refund.id
  end

  def test_should_list_payment_refunds
    response = @client.refunds.list

    refute_nil response.data
    assert response.data.length > 0
  end

  def test_should_refund_payment
    # Create new payment to refund
    payment_response = @client.payments.create(
      source_id: "cnon:card-nonce-ok",
      idempotency_key: new_test_uuid,
      amount_money: {
        amount: 200,
        currency: "USD"
      },
      app_fee_money: {
        amount: 10,
        currency: "USD"
      },
      autocomplete: true
    )

    response = @client.refunds.refund_payment(
      idempotency_key: new_test_uuid,
      payment_id: payment_response.payment.id,
      amount_money: {
        amount: 200,
        currency: "USD"
      }
    )

    refute_nil response.refund
    assert_equal payment_response.payment.id, response.refund.payment_id
  end

  def test_should_get_payment_refund
    response = @client.refunds.get(refund_id: @refund_id)

    refute_nil response.refund
    assert_equal @refund_id, response.refund.id
    assert_equal @payment_id, response.refund.payment_id
  end

  def test_should_handle_invalid_refund_id
    assert_raises(Square::SquareError) do
      @client.refunds.get(refund_id: "invalid-id")
    end
  end
end
