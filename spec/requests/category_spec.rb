require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'instances' do
    let!(:user) do
      User.create(
        full_name: 'John Doe',
        email: 'john@example.com',
        password: 'password123'
      )
    end

    let!(:category) do
      Category.create(
        name: 'Groceries',
        user:
      )
    end

    it 'is valid with valid attributes' do
      expect(category).to be_valid
    end

    it 'has a name' do
      expect(category.name).to eq('Groceries')
    end

    it 'belongs to a user' do
      expect(category.user).to eq(user)
    end

    # Add other instance tests as needed
  end
end
