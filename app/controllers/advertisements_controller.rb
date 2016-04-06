class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisment = Advertisement.find(params[:id])
  end

  def new
    @advertisment = Advertisement.new
  end

  def create
  end
end
