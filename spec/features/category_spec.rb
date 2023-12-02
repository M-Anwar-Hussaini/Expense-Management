# spec/features/categories_spec.rb
require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  let(:user) { User.create(full_name: 'John Doe', email: 'john@example.com', password: 'password123') }
  let!(:category) { Category.create(name: 'Sample Category', icon: 'sample-icon.png', user:) }

  before do
    login_as(user, scope: :user)
    visit user_categories_path(user)
  end

  scenario 'Should handle the links' do
    within('.text-bg-primary') do
      expect(page).to have_link('Home', href: root_path, class: 'btn btn-primary fw-bold')
      expect(page).to have_selector('h4', text: 'List of all categories')
    end
  end

  scenario 'has a selector that is text-bg-primary' do
    expect(page).to have_selector('.text-bg-primary', text: 'List of all categories')
  end
  scenario 'user views the list of categories' do
    unless user.categories.empty?
      expect(page).to have_selector('.list-group-item', count: user.categories.count)
      user.categories.each do |category|
        expect(page).to have_content(category.name)
        expect(page).to have_selector("img[src='#{category.icon}']")
        expect(page).to have_link(category.name, href: user_category_path(user, category))
        expect(page).to have_content(category.created_at.strftime('%Y-%m-%d'))
        expect(page).to have_content("$#{category.total_price}")
      end
    end
  end

  scenario 'Should have a link called add category' do
    expect(page).to have_link('Add new category', href: new_user_category_path(user), class: 'custom-btn')
  end

  scenario 'When there is not any category it should not render any thing' do
    expect(page).to have_selector('.alert-primary', text: 'There is not any category yet.') if user.categories.empty?
  end
end
