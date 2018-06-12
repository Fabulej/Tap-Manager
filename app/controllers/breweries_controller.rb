class BreweriesController < ApplicationController
  load_and_authorize_resource
  def new
    @brewery = Brewery.new
  end

  def create
    @brewery = Brewery.new(brewery_params)
    if @brewery.save
      flash[:notice] = "brewery created!"
      redirect_to breweries_path
    else
      flash[:error] = "You should name your brewery!"
      redirect_to new_brewery_path(@brewery)
    end
  end


  def index
    @breweries = Brewery.all
  end

  private

  def brewery_params
    params.require(:brewery).permit(:name)
  end
end
