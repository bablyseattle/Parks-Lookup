class ParksController < ApplicationController
  before_action :find_park, only: [:show, :update, :destroy]

   def index
    parks = Park.all
    json_response(parks)
  end

  def show
    @park = Park.find(params[:id])
    json_response(@park)
  end

  def create
    @park = Park.create(Park_params)
    json_response(@park)
  end

  def update
    @park = Park.find(params[:id])
    @park.update(Park_params)
  end

  def destroy
    @park = Park.find(params[:id])
    @park.destroy
  end

  private

  def park_params
    params.permit(:name, :state)
  end

  def find_park
    @park = Park.find(params[:id])
  end
end