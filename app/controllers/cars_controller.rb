class CarsController < ApplicationController
  # establish all 5 crud actions
  
  def index
    @cars = Car.all
    render json: @cars # using interpolation bc it doesn't work on react without @
    puts "index function"
  end

  def show
    @car = Car.find(params[:id]) # using params[:id] in order to have dynamic search functions :D
    render json: @car
    puts "show function"
  end

  def create
    @car = Car.new(model: params[:model], year: params[:year], manufacturer_id: params[:manufacturer_id])
     
    @car.save!
    render json: @car, status: :created
    puts "create function"
  end

  def update
    @car = Car.find(params[:id])
    
    @car.update(model: params[:model], year: params[:year])
    @car.save!
    render json: @car
    puts "update function"
  end

  def destroy
    @car = Car.find(params[:id])

    @car.destroy
    render json: { message: 'Car deleted.' }, status: :ok #renders message on httpie
    puts "destroy function"
  end

end
