class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)

    logger.debug "Request post parameters: #{params[:session]}"

    if user && user.authenticate(params[:session][:password])
      logger.debug "Successful user authentication: #{params[:session]}"

      # add user id in the session
      log_in user
      redirect_to user
    else
      # Create an error message.
      logger.debug "Bad user authentication: #{params[:session]}"
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
