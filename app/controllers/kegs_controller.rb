class KegsController < ApplicationController
load_and_authorize_resource except: :create
  def index
    @kegs = Keg.select("kegs.*, beers.name, taps.number").includes(:beer, :tap).order('beers.name, expiration_date').group(:name, :expiration_date, :in_use, :number)
    # Zapytanie grupuje duplikaty beczek
    # Keg.find_by_sql("SELECT COUNT(*), kegs.*, beers.name FROM kegs INNER JOIN beers ON kegs.beer_id=beers.id GROUP BY beers.name, kegs.in_use, kegs.expiration_date ")
  end

  def create
     respond_to do |format|
       if Keg.new(keg_params).valid?
         new_kegs = []
         params[:number].to_i.times do
           new_kegs << Keg.new(keg_params)
         end
         new_kegs.each(&:save)
         format.html { redirect_to kegs_path, notice: 'Keg was successfully created.' }
         format.json { render :index, status: :created, location: @keg }
       else
         format.html { render :new }
         format.json { render json: @keg.errors, status: :unprocessable_entity }
       end
     end
   end

  private

  def keg_params
    params.require(:keg).permit(:expiration_date, :beer_id, :pub_id)
  end
end
