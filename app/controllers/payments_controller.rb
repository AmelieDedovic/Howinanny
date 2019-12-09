class PaymentsController < ApplicationController
  def new
    @reservation = current_user.reservations.where(state: 'pending').find(params[:reservation_id])
  end
end
