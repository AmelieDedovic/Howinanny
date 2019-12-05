class NanniesController < ApplicationController
  def index
    @nannies = Nanny.all
    moving_areas = Nanny::MOVING_AREA
    if params[:moving_area] == 'Monde'
      moving_areas = 'Monde'
    elsif params[:moving_area] == 'Europe'
      moving_areas = ['Monde', 'Europe']
    else
      moving_areas = ['Monde', 'Europe', 'France']
    end
    @nannies = Nanny.where(moving_area: moving_areas)
    if params[:start_date].present? && params[:end_date].present?
      session[:start_date] = params[:start_date]
      session[:end_date] = params[:end_date]
      period = Time.parse(params[:start_date])..Time.parse(params[:end_date])
      @nannies.each do |nanny|
        nanny.reservations.try(:each) do |resa|
          if period.overlaps?(resa.start_date.to_s..resa.end_date.to_s)
            @nannies.where("id != :id", id: nanny.id)
          end
        end
      end
    end
  end

  def show
    @reservation = Reservation.new
    @nanny = Nanny.find(params[:id])
  end

  private

  def nanny_params
    params.require(:nanny).permit(:photo, :city, :description, :price_per_day, :experience, :moving_area)
  end
end
