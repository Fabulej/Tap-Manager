class StylesController < ApplicationController
  load_and_authorize_resource
  def new
    @style = Style.new
  end

  def create
    @style = Style.new(style_params)
    if @style.save
      flash[:notice] = "style created!"
      redirect_to styles_path
    else
      flash[:error] = "You should name your style!"
      redirect_to new_style_path(@style)
    end
  end


  def index
    @styles = Style.all
  end

  private

  def style_params
    params.require(:style).permit(:name, :description)
  end
end
