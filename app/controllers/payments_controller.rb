class PaymentsController < ApplicationController
  def new
    @reservation = current_user.reservations.find(params[:reservation_id])
  end
end
