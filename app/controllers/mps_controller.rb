class MpsController < ApplicationController
  respond_to :xml, :json

  def index
    @seats = Mp.includes([{ winners: :party }, {nominations: :party}]).all
    respond_with(@seats, include: { nominations: { include: :party } })
  end

  def show
    @seat = Mp.includes(:nominations).find(params[:id])
    respond_with(@seat, include: [{ winners: :party}, {nominations: :party}])
  end
end
