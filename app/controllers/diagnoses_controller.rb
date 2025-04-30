class DiagnosesController < ApplicationController
   # establish all 5 crud actions
  
   def index
    @diagnoses = Diagnosis.all
    render json: @diagnoses # using interpolation bc it doesn't work on react without @
  end

  def show
    @diagnosis = Diagnosis.find(params[:id]) # using params[:id] in order to have dynamic search functions :D
    render json: @diagnosis
  end

  def create
    @diagnosis = Diagnosis.new(params[:name], params[:description])
     
    @diagnosis.save!
    render json: @diagnosis, status: :created
  end

  def update
    @diagnosis = Diagnosis.find(params[:id])
    
    @diagnosis.update(params[:name], params[:description])
    
    @diagnosis.save!
    render json: @diagnosis
  end

  def destroy
    @diagnosis = Diagnosis.find(params[:id])

    @diagnosis.destroy
    render json: { message: 'diagnosis deleted.' }, status: :ok #renders message on httpie
  end

end
