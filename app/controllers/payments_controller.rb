class PaymentsController < ApplicationController
  def new
    @reservation = current_user.reservations.where(state: 'pending').find(params[:reservation_id])
    set_session
  end

  def update
    @reservation = Reservation.find(params[:reservation_id])
    set_session
  end


  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :user_id, :nanny_id, :state)
  end

  def set_session
    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @reservation.nanny.first_name,
          images: [@reservation.nanny.photo],
          amount: @reservation.total_price_cents,
          currency: 'eur',
          quantity: 1
        }],
        success_url: reservations_url(@reservation),
        cancel_url: reservations_url(@reservation)
      )
      @reservation.update(checkout_session_id: session.id)
  end

end
