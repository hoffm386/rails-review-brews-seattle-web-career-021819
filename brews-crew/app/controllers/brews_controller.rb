class BrewsController < ApplicationController

  before_action :set_brew, only: [:show, :edit, :update, :destroy]

  def index
    @brews = Brew.all
  end

  def destroy
    @brew.destroy
    redirect_to brews_path
  end

  def new
    @brew = Brew.new
  end

  def create
    @brew = Brew.create(brew_params)
    redirect_to @brew
  end

  def update
    @brew.update(brew_params)
    redirect_to @brew
  end

  def strongest
    @brew = Brew.strongest
    redirect_to @brew
  end

  def show
    @purchases = @brew.purchases
  end

  private

  def set_brew
    @brew = Brew.find(params[:id])
  end

  def brew_params
    params.require(:brew).permit(:blend_name, :origin, :notes, :strength)
  end
end
