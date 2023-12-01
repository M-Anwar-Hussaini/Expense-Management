require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject(:expense) do
    user = User.new(full_name: 'hamid tabish', email: 'hamid@gmail.com', password: 'password')
    Expense.new(name: 'Renting', user:, amount: 23)
  end

  it 'should be valid with all the given attributes' do
    expect(expense).to be_valid
  end

  it 'should not be valid with nil name' do
    expense.name = nil
    expect(expense).to be_valid
  end

  it 'should not be valid with nil amount attribute' do
    expense.amount = nil
    expect(expense).to be_valid
  end

  it 'should not be valid with nil user attribute' do
    expense.user = nil
    expect(expense).not_to be_valid
  end

  it 'should be a new instance of Expense' do
    expect(expense).to be_a_new(Expense)
  end
end
