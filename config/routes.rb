Rails.application.routes.draw do
  resources :manufacturers
  resources :cars
  resources :diagnoses
  resources :diagnosis_prompts
end
