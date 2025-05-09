class ManufacturersController < ApplicationController
  # establish all 5 crud actions
  
  def index
    @manufacturers = Manufacturer.all
    render json: @manufacturers # using interpolation bc it doesn't work on react without @
    puts "index function"
  end

  def show
    @manufacturer = Manufacturer.find(params[:id]) # using params[:id] in order to have dynamic search functions :D
    render json: @manufacturer
    puts "show function"
  end

  def create
    @manufacturer = Manufacturer.new(name: params[:name], country: params[:country])
     
    @manufacturer.save!
    render json: @manufacturer, status: :created
    puts "create function"
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
    
    @manufacturer.update(name: params[:name], country: params[:country])
    @manufacturer.save!
    render json: @manufacturer
    puts "update function"
  end

  def destroy
    @manufacturer = Manufacturer.find(params[:id])

    @manufacturer.destroy
    render json: { message: 'manufacturer deleted.' }, status: :ok #renders message on httpie
    puts "destroy function"
  end

end
