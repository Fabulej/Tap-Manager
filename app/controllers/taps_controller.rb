class TapsController < ApplicationController

  def show
    @tap = Tap.find(params[:id])
  end
  
  def new
    @tap = Tap.new
  end

  def create
    @tap = Tap.create(tap_params)
  end

  def destroy
  end

  def edit
    @tap = Tap.find(params[:id])
  end

  def update
    @tap = Tap.find(params[:id])
    @tap.keg = Keg.find(params[:keg_id])
    redirect_to taps_path
  end

  def index
    @taps = Tap.all
  end

  private

  def tap_params
    params.require(:tap).permit(
    :number, keg_attributes: [ :id ]
    )
  end
end
