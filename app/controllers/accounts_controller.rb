
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
	@user = user;

    @accounts = @user.find()
   end

  def show
  	@account = Account.find(params[:id])
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
