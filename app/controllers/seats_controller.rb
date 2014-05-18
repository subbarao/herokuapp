class SeatsController < ApplicationController
  before_filter :set_klass

  def index
    @seats = @klass.includes([{ winners: :party }, { winner: :party, runner: :party } ]).all
    render template: 'seats/index'
  end

  def show
    @seat = @klass.includes(:nominations).find(params[:id])
    render template: 'seats/show'
  end
end
