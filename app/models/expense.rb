class Expense < ApplicationRecord
  has_many :category_expenses, dependent: :destroy
  belongs_to :user
end
