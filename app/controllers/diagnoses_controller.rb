class DiagnosesController < ApplicationController
   # establish all 5 crud actions
  
   def index
    if params[:category]
      category = Category.find_by(name: params[:category])
      @prompts = category ? category.diagnoses : []
    else
      @prompts = Diagnosis.all
    end

    render json: @prompts.to_json(include: :category)
  end

  def show
    @diagnosis = Diagnosis.find(params[:id])
    render json: @diagnosis.to_json(include: :category)
  end

  def create
    @diagnosis = Diagnosis.new(name: params[:name], description: params[:description], category_id: params[:category_id])
     
    @diagnosis.save!
    render json: @diagnosis, status: :created
  end

  def update
    @diagnosis = Diagnosis.find(params[:id])
    
    @diagnosis.update(category_id: params[:category_id])
    
    @diagnosis.save!
    render json: @diagnosis
  end

  def destroy
    @diagnosis = Diagnosis.find(params[:id])

    @diagnosis.destroy
    render json: { message: 'diagnosis deleted.' }, status: :ok #renders message on httpie
  end

end
