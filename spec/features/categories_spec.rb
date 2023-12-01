# spec/features/categories_spec.rb

require 'rails_helper'

RSpec.feature 'Categories feature', type: :feature do
  let(:user) { create_user }

  def create_user
    User.create!(
      full_name: 'John Doe',
      email: 'john@example.com',
      password: 'password..'
    )
  end

  scenario 'User visits the categories page with no categories' do
    visit user_categories_path(user)
  end

  scenario 'User visits the categories page with categories' do
    visit user_categories_path(user)
  end

  scenario 'User adds a new category' do
    visit user_categories_path(user)
  end

  private

  def create_categories(user)
    [
      Category.create!(name: 'Category 1', icon: 'icon1.png', user:),
      Category.create!(name: 'Category 2', icon: 'icon2.png', user:),
      Category.create!(name: 'Category 3', icon: 'icon3.png', user:)
    ]
  end
end
