require 'json'
require 'open-uri'

class PaymentsController < ApplicationController
   skip_before_action :verify_authenticity_token, only: [:split]

  def new
    @reservation = current_user.reservations.where(state: 'pending').find(params[:reservation_id])

  end

  def new_split
    @reservation = Reservation.find(params[:reservation_id])
    render 'payments/edit'
  end

  def split
    mails = params[:myInputs].count
    @reservation = Reservation.find(params[:reservation_id])
    @my_price = @reservation.total_price_cents / (mails + 1)

    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @reservation.nanny.first_name,
          images: [@reservation.nanny.photo],
          amount: @my_price,
          currency: 'eur',
          quantity: 1
        }],
        success_url: reservations_url(@reservation),
        cancel_url: reservations_url(@reservation)
      )

      @reservation.update(checkout_session_id: session.id)

    params[:myInputs].each do |mail|
      # if User.where(email: mail) != []
          session = Stripe::Checkout::Session.create(
              payment_method_types: ['card'],
              customer_email: mail,
              line_items: [{
                name: @reservation.nanny.first_name,
                images: [@reservation.nanny.photo],
                amount: @my_price,
                currency: 'eur',
                quantity: 1
              }],
              success_url: reservations_url(@reservation),
              cancel_url: reservations_url(@reservation)
            )

            @reservation.update(checkout_session_id: session.id)

      # end
      UserMailer.with(user: mail).div_payment.deliver_now
    end
  end



  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :user_id, :nanny_id, :state)
  end

end
