class ReservationsController < AuthenticatedController
  before_action :set_nanny, only: [:new, :create]

  def index
    @reservations = current_user.reservations
  end

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

    if dispo == true && @reservation.save

      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @nanny.first_name,
          images: [@nanny.photo],
          amount: @reservation.total_price_cents,
          currency: 'eur',
          quantity: 1
        }],
        success_url: reservations_url(@reservation),
        cancel_url: reservations_url(@reservation)
      )

      @reservation.update(checkout_session_id: session.id)

      redirect_to reservations_path
    else
      @nannies = Nanny.all
      render '../views/nannies/index'
    end
  end

  private

  def set_total_price
    @days = (@reservation.end_date - @reservation.start_date).to_i
    @reservation.total_price_cents = @days * @reservation.nanny.price_per_day_cents * 100
  end

  def set_nanny
    @nanny = Nanny.find(params[:nanny_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :user_id, :nanny_id, :state)
  end
end
