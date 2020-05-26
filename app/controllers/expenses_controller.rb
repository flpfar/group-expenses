class ExpensesController < ApplicationController
  before_action :authenticate_user, only: %i[index new]

  def index
    # @expenses = params[:external] == 'true' ? current_user.external_expenses : current_user.expenses
    if params[:external] == 'true'
      @expenses = current_user.external_expenses
      @type = :external
    elsif params[:group] == 'true'
      @expenses = Group.find(params[:group_id]).expenses
      @type = :group
    else
      @expenses = current_user.expenses
      @type = :all
    end
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
      flash.now[:alert] = 'Failed to create expense.'
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :author_id, :group)
  end
end
