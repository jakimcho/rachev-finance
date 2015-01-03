class AccountsController < ApplicationController
  def index
     @accounts = Account.all
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
      params.require(:account).permit(:title, :text)
    end
end
