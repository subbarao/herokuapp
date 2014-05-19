class SeatsController < ApplicationController
  before_filter :set_klass
  caches_action :index, :show
  def index
    @seats = @klass.includes([{ nominations: :party }, { winner: :party, runner: :party } ])
    if params[:state_id]
      @seats = @seats.where(state_id: params[:state_id]).all
    end
    render template: 'seats/index'
  end

  def show
    @seat = @klass.includes(:nominations).find(params[:id])
    render template: 'seats/show'
  end
end
