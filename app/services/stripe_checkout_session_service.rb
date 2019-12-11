class StripeCheckoutSessionService
  def call(event)
    @payment = Payment.find_by(checkout_session_id: event.data.object.id)
    @payment.update(state: 'paid')
    @reservation = @payment.reservation

    unpaid = @reservation.payments.reject { |payment|  payment.state == 'paid'}

    @reservation.update(state: 'Payé') if unpaid.empty?

  end
end
