require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include Devise::Test::IntegrationHelpers

  let!(:user) do
    User.create(full_name: 'Anwar Hussaini', email: 'anwar@gmail.com', password: 'secret password')
  end

  let!(:category) do
    Category.create(name: 'Travel', icon: 'Some icon', user:)
  end

  before do
    sign_in user
    get user_categories_path(user)
  end

  describe 'Category GET/ index ' do
    it 'returns recipe http success' do
      expect(response).to have_http_status(200)
    end
    it 'renders recipe template' do
      expect(response).to render_template(:index)
    end
  end

  describe "Category GET /show'" do
    before do
      sign_in user
      get user_categories_path(user, category)
    end
  end
end
