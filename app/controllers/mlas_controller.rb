class MlasController < ApplicationController
  respond_to :html, :json
  def index
    @seats = Mla.includes([{ winners: :party }, {nominations: :party}]).all
    respond_with(@seats, include: { nominations: { include: :party } })
  end

  def show
    @seat = Mla.includes(:nominations).find(params[:id])
    respond_with(@seat, include: [{ winners: :party}, {nominations: :party}])
  end
end
