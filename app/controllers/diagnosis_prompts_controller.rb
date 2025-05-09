class DiagnosisPromptsController < ApplicationController
  # establish all 5 crud actions
  # GET /diagnosis_prompts?category=Engine
  def index
    if params[:category]
      category = Category.find_by(name: params[:category])
      @prompts = category ? category.diagnosis_prompts : []
    else
      @prompts = DiagnosisPrompt.all
    end

    render json: @prompts.to_json(include: :category)
  end

  

  def show
    @diagnosis_prompt = DiagnosisPrompt.find(params[:id]) # using params[:id] in order to have dynamic search functions :D
    render json: @diagnosis_prompt, status: :ok
  end

  def create
    @diagnosis_prompt = DiagnosisPrompt.new(question: params[:question], diagnosis_id: params[:diagnosis_id], category_id: params[:category_id])
     
    @diagnosis_prompt.save!
    render json: @diagnosis_prompt, status: :created
  end

  def update
    @diagnosis_prompt = DiagnosisPrompt.find(params[:id])
    
    @diagnosis_prompt.update(question: params[:question])
    @diagnosis_prompt.save!
    render json: @diagnosis_prompt, status: :ok
  end

  def destroy
    @diagnosis_prompt = DiagnosisPrompt.find(params[:id])

    @diagnosis_prompt.destroy
    render json: { message: 'diagnosis_prompt deleted.' }, status: :ok #renders message on httpie
  end

end
