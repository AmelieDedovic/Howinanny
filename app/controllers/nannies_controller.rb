class NanniesController < ApplicationController
  def index
    @nannies = Nanny.all
  end

  def show
    @nanny = Nanny.find(params[:id])
  end
end
