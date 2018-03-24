class KegsController < ApplicationController
  def index
    @kegs = Keg.select("kegs.*, beers.name, taps.number").includes(:beer, :tap).order('beers.name, expiration_date').group(:name, :expiration_date, :in_use, :number)
    # Zapytanie grupuje duplikaty beczek
    # Keg.find_by_sql("SELECT COUNT(*), kegs.*, beers.name FROM kegs INNER JOIN beers ON kegs.beer_id=beers.id GROUP BY beers.name, kegs.in_use, kegs.expiration_date ")


  end

  private

  def kegs_params
    params.require(:kegs).permit(:expiration_date, :in_use, :priority)
  end
end
