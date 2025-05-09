class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories
  end

  def show
    @category = Category.find(params[:id])
    render json: @category
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Category not found' }, status: :not_found
  end

  def create
    @category = Category.new(name: params[:name])
     
    @category.save!
    render json: @category, status: :created
    puts "create function"
  end

  def update
    @category = Category.find(params[:id])
    
    @category.update(name: params[:name])
    @category.save!
    render json: @category
    puts "update function"
  end

  def destroy
    @category = Category.find(params[:id])

    @category.destroy
    render json: { message: 'category deleted.' }, status: :ok #renders message on httpie
    puts "destroy function"
  end
end

