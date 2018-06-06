class TapsController < ApplicationController
load_and_authorize_resource
skip_before_action :pub_and_taps, only: [:new, :create]
  def show
    @tap = Tap.find(params[:id])
  end

  def create
     respond_to do |format|
       if Tap.new(tap_params).valid?
         new_taps = []
         params[:number].to_i.times do
           new_taps << Tap.new(tap_params)
         end
         new_taps.each(&:save)
         format.html { redirect_to taps_path, notice: 'Tap was successfully created.' }
         format.json { render :index, status: :created, location: @tap }
       else
         format.html { render :new }
         format.json { render json: @tap.errors, status: :unprocessable_entity }
       end
     end
   end

  def destroy
  end

  def edit
    @tap = Tap.find(params[:id])
  end

  def update
    @tap = Tap.find(params[:id])
    @tap.keg.destroy
    @tap.keg = Keg.find(params[:keg_id])
    redirect_to taps_path
  end

  def index
    @taps = Tap.all
  end

  private

  def tap_params
    params.require(:tap).permit(
    :number, :pub_id, keg_attributes: [ :id ]
    )
  end
end
