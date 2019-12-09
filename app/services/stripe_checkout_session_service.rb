class StripeCheckoutSessionService
  def call(event)
    @reservation = Reservation.find_by(checkout_session_id: event.data.object.id)
    @reservation.state = 'Payé'
    @reservation.save!
    # @reservation.update(state: 'paid')
  end
end
