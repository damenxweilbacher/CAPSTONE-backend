class DiagnosisPromptsController < ApplicationController
   # establish all 5 crud actions
  
   def index
    @diagnosis_prompts = DiagnosisPrompt.all
    render json: @diagnosis_prompts # using interpolation bc it doesn't work on react without @
  end

  def show
    @diagnosis_prompt = DiagnosisPrompt.find(params[:id]) # using params[:id] in order to have dynamic search functions :D
    render json: @diagnosis_prompt
  end

  def create
    @diagnosis_prompt = DiagnosisPrompt.new(params[:question], params[:diagnosis_id])
     
    @diagnosis_prompt.save!
    render json: @diagnosis_prompt, status: :created
  end

  def update
    @diagnosis_prompt = DiagnosisPrompt.find(params[:id])
    
    @diagnosis_prompt.update(params[:question], params[:diagnosis_id])
    @diagnosis_prompt.save!
    render json: @diagnosis_prompt
  end

  def destroy
    @diagnosis_prompt = DiagnosisPrompt.find(params[:id])

    @diagnosis_prompt.destroy
    render json: { message: 'diagnosis_prompt deleted.' }, status: :ok #renders message on httpie
  end

end
