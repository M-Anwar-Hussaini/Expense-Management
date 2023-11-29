class CreateCategoryExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :category_expenses do |t|
      t.references :category, foreign_key: true
      t.references :expense, foreign_key: true

      t.timestamps
    end
  end
end
