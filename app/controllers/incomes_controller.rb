require "pp"

class IncomesController < ApplicationController
  def index
  end

  def new
  end

  def create
    logger.debug "Parameters came from income create form #{income_params}"
    params = income_params.merge({user_id: current_user.id})
    pp params
    @income = Income.new(params)

    logger.debug "After income creation #{@income}"

    if @income.save
      logger.debug  [current_user, @income].inspect
      add_income_to_account @income.account_id, @income.income
      redirect_to [current_user, @income]
    else
      redirect_to new_user_income_path(current_user)
    end
  end

  def show
    @income = Income.find(params[:id])
  end

  private

  def income_params
    params.require(:income).permit(:title, :date, :description, :income, :account_id)
  end

  def add_income_to_account account_id, income
    account = Account.find(account_id)
    account.balance += income;
    account.save
  end
end
