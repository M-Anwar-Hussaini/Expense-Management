FactoryBot.define do
  factory :expense do
    full_name { 'John Doe' }
    email { 'john@example.com' }
    password { 'password123' }
  end
end
