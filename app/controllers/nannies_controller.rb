class NanniesController < ApplicationController
  def index
    @nannies = Nanny.all
  end

  def show
    @nanny = Nanny.find(params[:id])
  end

  private

  def nanny_params
    params.require(:nanny).permit(:photo, :city, :description, :price_per_day, :experience, :moving_area)
  end
end
