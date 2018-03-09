class TapsController < ApplicationController
  def new
  end

  def create
  end

  def destroy
  end

  def index
    @taps = Tap.all
  end
end
