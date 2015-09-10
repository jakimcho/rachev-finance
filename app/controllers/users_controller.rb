#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  password   :string(255)      not null
#  family_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  email      :string(255)

class UsersController < ApplicationController


  def index
    @users = User.all
  end

  def create
    logger.debug user_params
    logger.debug "Password #{params[:user]}"
    logger.debug "password_confirmation #{params[:password_confirmation]}"
    if params[:password].equal? params[:password_confirmation]
      logger.debug 'parolite sa ednakwi'
    end

    @user = User.new user_params
    logger.debug @user.inspect

    if @user.save
      logger.debug "success"
      redirect_to users_path
    else
      flash[:error] = @user.errors.full_messages[0]
      redirect_to new_user_path
    end
  end

  def new
    
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def update

  end

private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email, :family_id)
  end
end
