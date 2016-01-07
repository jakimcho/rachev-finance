
#  id         :integer          not null, primary key
#  name       :string(255)
#  balance    :decimal(, )
#  user_id    :integer
#  icon       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
class AccountsController < ApplicationController

  def index
    logger.debug "enter in accounts#index"
    @user = User.find(params[:user_id])

    logger.debug @user
    logger.debug "Number of the account is " + @user.accounts.length.to_s

    @accounts = @user.accounts
    debugger
  end

  def show
  	@account = Account.find(params[:id])
    debugger
  end

  def new
  end

  def create
    @account = Account.new(account_params)
   
    @account.save
    redirect_to @account
  end
   
  private
    def account_params
      params.require(:account).permit(:name, :user_id, :balance, :icon)
    end
end
