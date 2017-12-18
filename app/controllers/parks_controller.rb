class ParksController < ApplicationController
  include Response

   def index
    @parks = Park.all
    name = params[:name]
    if name
      @parks = Park.search(name)
    end
    json_response(@parks)
  end

  def show
    @park = Park.find(params[:id])
    json_response(@park)
  end

  def create
    @park = Park.create!(Park_params)
    json_response(@park, :created)
  end

  def update
    if @park.update!(park_params)
      render status: 200, json: {
        message: "The park has been updated successfully."
      }
    end
  end

  def destroy
    if @park.destroy
      render status: 200, json: {
        message: "The park has been deleted."
      }
    end
  end

  private

  def park_params
    params.permit(:name, :state)
  end

end