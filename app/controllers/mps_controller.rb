class MpsController < ApplicationController
  def index
    @seats = Mp.all
  end

  def show
    @seat = Mp.includes(:nominations).find(params[:id])
  end
end
