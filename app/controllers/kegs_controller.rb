class KegsController < ApplicationController
  def index
    @kegs = Keg.all
  end

  private

  def kegs_params
    params.require(:kegs).permit(:expiration_date, :in_use, :priority)
  end
end
