require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is not valid without icon' do
    category = Category.new(name: 'Education')
    expect(category).not_to be_valid
  end

  it 'should not be valid without name and icon' do
    category = Category.new
    expect(category).not_to be_valid
  end

  it 'should not be valid with no user' do
    category = Category.new(name: 'Education', icon: 'some icon')
    expect(category).not_to be_valid
  end

  it 'should be valid with name, icon and user' do
    user = User.new(full_name: 'User Account', email: 'user@gmail.com', password: 'Some password')
    category = Category.create(name: 'Education', icon: 'some icon', user:)
    expect(category).to be_valid
  end
end
