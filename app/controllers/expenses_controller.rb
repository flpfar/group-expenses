class ExpensesController < ApplicationController
  before_action :authenticate_user, only: %i[index new]

  def index
    if params[:external] == 'true'
      @expenses = current_user.external_expenses.order(created_at: :desc)
      @type = :external
    elsif params[:group] == 'true'
      @group_id = params[:group_id]
      @expenses = Group.find(@group_id).expenses.order(created_at: :desc)
      @type = :group
    else
      @expenses = current_user.expenses.order(created_at: :desc)
      @type = :all
    end
  end

  def new
    @expense = Expense.new
    @group_id = params[:group_id].to_i
    @groups = Group.all.order(:name)
  end

  def create
    @expense = current_user.expenses.new(expense_params)

    if @expense.save
      Group.find(expense_params[:group]).expenses << @expense unless expense_params[:group] == '-1'
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
