class ReservationsController < ApplicationController
  before_action :set_nanny
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.nanny = @nanny
    @reservation.user = current_user
    dispo = true
    @nanny.reservations.each do |resa|
      @start = resa.start_date
      @end = resa.end_date
      if @reservation.start_date.between?(@start, @end) || @reservation.end_date.between?(@start, @end)
        flash.now[:notice] = "#{@nanny.first_name} n'est pas disponible à ces dates"
        dispo = false
      end
    end
    set_total_price
    if @reservation.save && dispo == true
      redirect_to dashboard_path
    else
      render '../views/reservations/new'
    end
  end

  private

  def set_total_price
    @days = (@reservation.end_date - @reservation.start_date).to_i
    @reservation.total_price = @days * @reservation.hen.price_per_day
  end

  def set_nanny
    @nanny = Nanny.find(params[:nanny_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :user_id, :nanny_id)
  end

end
