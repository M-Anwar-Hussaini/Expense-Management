# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'instances' do
    let!(:user) do
      User.create(
        full_name: 'John Doe',
        email: 'john@example.com',
        password: 'password123'
      )
    end

    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'has a full name' do
      expect(user.full_name).to eq('John Doe')
    end

    it 'has an email' do
      expect(user.email).to eq('john@example.com')
    end

    it 'has a password' do
      expect(user.password).to eq('password123')
    end

    # Add other instance tests as needed
  end
end
