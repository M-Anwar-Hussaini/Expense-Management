class Category < ApplicationRecord
  belongs_to :user
  has_many :category_expenses, dependent: :destroy

  def total_price
    ce = category_expenses.where(self == :category)
    total = 0
    ce.each do |expense|
      total += expense.amount
    end
    total.to_f
  end
end
