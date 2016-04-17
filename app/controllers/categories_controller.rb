class CategoriesController < ApplicationController
  def new
  end
  
  def create
    logger.debug "Parameters came from expense create form #{category_params}"

    @category = Category.new(category_params)

    logger.debug "After income creation #{category_params}"

    if @category.save
      logger.debug  @category.inspect
      redirect_to categories_path
    else
      redirect_to new_category_path
    end
  end
  
  def show
    
  end
  
  def index
    @categories = Category.all
  end
  
  private

  def category_params
    params.require(:category).permit(:description, :summary, :category_id, :date, :icon)
  end

end
