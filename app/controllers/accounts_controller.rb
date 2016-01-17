
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
    logger.debug current_user
    logger.debug "Number of the account is " + current_user.accounts.length.to_s

    @accounts = current_user.accounts
  end

  def show
  	@account = Account.find(params[:id])
  end

  def new
    
  end

  def create
    params = account_params.merge({user_id: current_user.id})
    logger.debug "account_params #{params}"
    @account = Account.new(params)
    
    logger.debug "After creating new account " + @account.inspect
    if @account.save
      logger.debug  [current_user, @account].inspect
      redirect_to [current_user, @account]
    else
      redirect_to new_user_account_path(current_user)
    end
  end
   
  private
    def account_params
      params.require(:account).permit(:name, :balance)
    end
end
