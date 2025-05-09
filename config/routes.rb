Rails.application.routes.draw do
  resources :manufacturers
  resources :cars
  
  # category filtering
  get 'category/:category/diagnosis_prompts', to: 'diagnosis_prompts#index'
  get 'category/:category/diagnoses', to: 'diagnoses#index'
  
  # resource routes
  resources :diagnoses
  resources :diagnosis_prompts
  resources :categories
end

