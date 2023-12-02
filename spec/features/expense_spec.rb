# spec/features/expenses_category_spec.rb
require 'rails_helper'

RSpec.feature 'Expenses Category', type: :feature do
  let(:user) { User.create(full_name: 'John Doe', email: 'john@example.com', password: 'password123') }
  let(:category) { Category.create(name: 'Sample Category', icon: 'sample-icon.png', user:) }
  let(:expense) { Expense.create(name: 'Dinner', amount: 50.0, user:) }
  let(:expenses) { [expense] }
  let!(:category_expense) { CategoryExpense.create(category:, expense:) }

  before do
    login_as(user, scope: :user)
    visit user_category_path(user, category)
  end

  scenario 'user views all expenses for a category with header' do
    expect(page).to have_content(expense.name)
    expect(page).to have_content("$#{expense.amount}")
    expect(page).to have_selector('.bg-body', text: 'Total expenses:')
    expect(page).to have_selector('.fw-bold', text: "$#{category.total_price}")
  end

  scenario 'display the amount of expense' do
    expect(page).to have_content("$#{expense.amount}")
  end

  scenario 'display the date of expense' do
    expect(page).to have_content(expense.created_at.strftime('%Y-%m-%d'))
  end

  scenario 'display the button to add a new expense' do
    expect(page).to have_link('Add new expense', href: new_user_expense_path(user), class: 'custom-btn')
  end
end
