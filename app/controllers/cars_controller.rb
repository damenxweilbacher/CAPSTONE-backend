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
    # Convert manufacturer_id to integer
    manufacturer_id = params[:manufacturer_id].to_i if params[:manufacturer_id].present?
    
    @car = Car.new(
      model: params[:model],
      year: params[:year].to_i,
      image_url: params[:image_url],
      manufacturer_id: manufacturer_id
    )
     
    if @car.save
      render json: @car, status: :created
      puts "create function"
    else
      render json: { errors: @car.errors.full_messages }, status: :unprocessable_entity
      puts "Failed to create car: #{@car.errors.full_messages}"
    end
  end

  def update
    @car = Car.find(params[:id])
    
    @car.update(model: params[:model], year: params[:year], image_url: params[:image_url])
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
