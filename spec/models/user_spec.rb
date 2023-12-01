require 'rails_helper'

RSpec.describe User, type: :model do
  context 'When initialized' do
    subject(:user) { User.new }
    it 'is a new user' do
      expect(user).to be_a_new(User)
    end

    it 'is not a new Category' do
      expect(user).not_to be_a_new(Category)
    end
  end

  context 'When saved' do
    subject(:user) { User.create(full_name: 'Hamid Tabish', email: 'hamid@gmail.com', password: 'secretpassword') }
    it 'is not a new User' do
      expect(user).not_to be_a_new(User)
    end

    it 'should not be a new String' do
      expect(user).not_to be_a_new(String)
    end
  end
end
