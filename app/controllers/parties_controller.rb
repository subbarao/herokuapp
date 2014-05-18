class PartiesController < ApplicationController
  def show
    @party = Party.find(params[:id])
  end

  def index
  end
end
