class MlasController < ApplicationController
  def index
    @seats = Mla.all
  end

  def show
    @seat = Mla.includes(:nominations).find(params[:id])
  end
end
