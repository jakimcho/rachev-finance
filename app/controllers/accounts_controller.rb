
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
    logger.debug user
    logger.debug "Number of the account is " + user.accounts.length.to_s

    @accounts = user.accounts
  end

  def show
  	@account = Account.find(params[:id])
  end

  def new
    
  end

  def create
    @account = Account.new(account_params)
   
    @account.save
    redirect_to user_account_url
  end
   
  private
    def account_params
      params.require(:account).permit(:name, :balance)
    end
    
    def user
      User.find(params[:user_id])
    end
end
