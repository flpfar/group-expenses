class ExpensesController < ApplicationController
  before_action :authenticate_user, only: %i[index new]

  def index
    @expenses = current_user.expenses
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = expense_params
    @expense = current_user.expenses.new(expense_params)
    if @expense.save
      flash[:notice] = 'Expense was successfully created.'
      redirect_to user_expenses_path(current_user.id)
    else
      flash[:alert].now = 'Failed to create expense.'
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :author_id, :group)
  end
end
