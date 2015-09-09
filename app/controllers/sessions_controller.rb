class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    logger.debug params[:session]
    logger.debug params[:session][:password_digest]
    if user && user.authenticate(params[:session][:password_digest])
      @user = user;
      render home_index_path
    else
      # Create an error message.
      render 'new'
    end
  end

  def destroy
  end
end
