class SeatsController < ApplicationController
  def index
    @seats = Mla.all
  end

  def show
    @seat = Seat.includes(:nominations).find(params[:id])
  end
end
