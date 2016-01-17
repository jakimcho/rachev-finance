class ExpensesController < ApplicationController
  def index
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
  end

  def create
    logger.debug "Parameters came from expense create form #{expense_params}"

    @expense = Expense.new(expense_params)

    logger.debug "After income creation #{@expense}"

    if @expense.save
      logger.debug  [current_user, @expense].inspect
      add_expense_to_account @expense.account_id, @expense.amount
      redirect_to [current_user, @expense]
    else
      redirect_to new_user_expenses_path(current_user)
    end
  end

  private

  def expense_params
    p = params.require(:expense).permit(:description, :amount, :account_id, :date)
    p.merge({user_id: current_user.id})
  end

  def add_expense_to_account account_id, expense
    account = Account.find(account_id)
    account.balance -= expense;
    account.save
  end
end
