require 'json'
require 'open-uri'

class PaymentsController < ApplicationController
   skip_before_action :verify_authenticity_token, only: [:split]

  def new
    @reservation = current_user.reservations.where(state: 'pending').find(params[:reservation_id])
    @payment = Payment.new
    @payment.reservation = @reservation
    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @payment.reservation.nanny.first_name,
          images: [@payment.reservation.nanny.photo],
          amount: @payment.reservation.total_price_cents,
          currency: 'eur',
          quantity: 1
        }],
        success_url: reservations_url(@reservation),
        cancel_url: reservations_url(@reservation)
      )

      @payment.update(checkout_session_id: session.id)

  end

  def new_split
    @reservation = Reservation.find(params[:reservation_id])
    render 'payments/edit'
  end

  def split
    @mails = params[:myInputs].count
    @reservation = Reservation.find(params[:reservation_id])
    @payment = Payment.new
    @payment.reservation = @reservation
    @payment.price_cents = @reservation.total_price_cents / (@mails + 1)

    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @payment.reservation.nanny.first_name,
          images: [@payment.reservation.nanny.photo],
          amount: @payment.price_cents,
          currency: 'eur',
          quantity: 1
        }],
        success_url: reservations_url(@reservation),
        cancel_url: reservations_url(@reservation)
      )

      @payment.update(checkout_session_id: session.id)
      @payment.save

    params[:myInputs].each do |mail|
      # if User.where(email: mail) != []
      payment = Payment.new
      payment.reservation = @reservation
      payment.price_cents = @reservation.total_price_cents / (@mails + 1)
          session = Stripe::Checkout::Session.create(
              payment_method_types: ['card'],
              line_items: [{
                name: payment.reservation.nanny.first_name,
                images: [payment.reservation.nanny.photo],
                amount: payment.price_cents,
                currency: 'eur',
                quantity: 1
              }],
              success_url: reservations_url(@reservation),
              cancel_url: reservations_url(@reservation)
            )

            payment.update(checkout_session_id: session.id)
            payment.save

      UserMailer.with(user: mail, payment: payment).div_payment.deliver_now
    end
  end

  def payshare
    @payment = Payment.find(params[:payment_id])

    render 'payments/split'
  end




  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :user_id, :nanny_id, :state)
  end

end
