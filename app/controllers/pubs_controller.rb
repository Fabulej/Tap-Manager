class PubsController < ApplicationController
  skip_before_action :pub_and_taps, only: [:new, :create]
  def new
    @pub = Pub.new
  end

  def create
    @pub = Pub.new(pub_params)
    if @pub.save
      current_user.update(pub: @pub)
      flash[:notice] = "Pub created!"
      redirect_to new_tap_path
    else
      flash[:error] = "You should name your pub!"
      redirect_to new_pub_path(@pub.tap_id)
    end
  end

  private

  def pub_params
    params.require(:pub).permit(:name)
  end
end
