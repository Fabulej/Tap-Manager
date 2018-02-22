class BeersController < ApplicationController

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.create(beer_params)

     respond_to do |format|
       if @beer.save
         format.html { redirect_to @beer, notice: 'Beer was successfully created.' }
         format.json { render :show, status: :created, location: @beer }
       else
         format.html { render :new }
         format.json { render json: @beer.errors, status: :unprocessable_entity }
       end
     end
   end

  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find(params[:id])
  end

  private

  def beer_params
    params.require(:beer).permit(
    :name, :plato, :ibu, :abv, :price,
    :brewery_id, :style_id
    )
  end

end
