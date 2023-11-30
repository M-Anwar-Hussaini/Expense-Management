class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @category_expense = CategoryExpense.new
  end

  def index; end

  def create
    @expense = Expense.new(expense_params)
    @expense.user = current_user
    if @expense.save
      ce = CategoryExpense.new(category_id: params[:expense][:category], expense_id: @expense.id)
      if ce.save
        redirect_to user_categories_path(current_user), notice: 'The expense was successfully added.'
      else

        render plain: ce.errors.full_messages
      end

    else
      # render :new, notice: 'There is some problem.'
    end
  end

  def show; end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end

  def category_params
    params.require(:expense).permit(:category)
  end
end
