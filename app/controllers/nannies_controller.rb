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
      period = Time.parse(params[:start_date])..Time.parse(params[:end_date])
      @nannies.each do |nanny|
        nanny.reservations.try(:each) do |resa|
          if period.overlap?(Time.parse(resa.start_date)..Time.parse(resa.end_date))
            @nannies.reject(nanny)
          end
        end
      end
    end
  end

  def show
    @nanny = Nanny.find(params[:id])
  end

  private

  def nanny_params
    params.require(:nanny).permit(:photo, :city, :description, :price_per_day, :experience, :moving_area)
  end
end
