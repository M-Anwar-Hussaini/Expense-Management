# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    full_name { 'John Doe' }
    email { 'john@example.com' }
    password { 'password123' }
  end
end