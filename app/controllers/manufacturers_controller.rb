class ManufacturersController < ApplicationController
  # establish all 5 crud actions
  
  def index
    @manufacturers = Manufacturer.all
    render json: @manufacturers # using interpolation bc it doesn't work on react without @
  end

  def show
    @manufacturer = Manufacturer.find(params[:id]) # using params[:id] in order to have dynamic search functions :D
    render json: @manufacturer
  end

  def create
    @manufacturer = Manufacturer.new(params[:name], params[:country])
     
    @manufacturer.save!
    render json: @manufacturer, status: :created
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
    
    @manufacturer.update(params[:name], params[:country])
    @manufacturer.save!
    render json: @manufacturer
  end

  def destroy
    @manufacturer = Manufacturer.find(params[:id])

    @manufacturer.destroy
    render json: { message: 'manufacturer deleted.' }, status: :ok #renders message on httpie
  end

end
