class FamiliesController < ApplicationController

  def index
    @families = Family.all
  end

  def new
    logger.debug "Hello"
  end

  def create
    logger.debug family_params
    @families = Family.new(family_params)
    
    logger.debug @families.inspect
    if @families.save
      
      flash[:families_id] = @families.id
      redirect_to families_url
    else
      render :action => "new"
    end
  end

  private

  def family_params
    params.require(:families).permit(:name, :pass)
  end
end
