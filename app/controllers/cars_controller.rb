class CarsController < ApplicationController
  # establish all 5 crud actions
  
  def index
    @cars = Car.all
    render json: @cars # using interpolation bc it doesn't work on react without @
  end

  def show
    @car = Car.find(params[:id]) # using params[:id] in order to have dynamic search functions :D
    render json: @car
  end

  def create
    @car = Car.new(params[:model], params[:year], params[:manufacturer_id])
     
    @car.save!
    render json: @car, status: :created
  end

  def update
    @car = Car.find(params[:id])
    
    @car.update(params[:model], params[:year], params[:manufacturer_id])
    @car.save!
    render json: @car
  end

  def destroy
    @car = Car.find(params[:id])

    @car.destroy
    render json: { message: 'Car deleted.' }, status: :ok #renders message on httpie
  end

end
