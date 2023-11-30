class CategoriesController < ApplicationController
  # GET /categories or /categories.json
  def index
    @categories = current_user.categories.order(created_at: :desc)
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = Category.find(params[:id])
    category_expenses = Category.find(params[:id]).category_expenses.reverse
    @expenses = []
    category_expenses.each do |ce|
      @expenses << ce.expense
    end
  end

  # GET /categories/new
  def new
    @category = Category.new
    @category.user = current_user
  end

  # GET /categories/1/edit
  def edit; end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    @category.user = current_user

    if @category.save
      redirect_to user_categories_path(current_user)
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy!

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
