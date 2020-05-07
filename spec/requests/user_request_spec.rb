require 'rails_helper'
include ActionController::RespondWith

RSpec.describe "Users", type: :request do
  describe "Rotas: Users" do
    describe "GET /users" do
      describe "status 200" do
        it "retorna a lista de usuários" do
          get '/users'
          User.delete_all
          user = User.create()
          user.first_name = 'Maikel'
          user.last_name = 'Bald'
          user.email = 'maikel@ruptiva.com'
          user.password = 'ilikeruptiva'
          user.save!
          puts "{#user}"
          login
          expect(response.status).to eq(200)
        end
      end
    end
  end

  def login
    post "/auth/sign_in", params:  { email: 'maikel@ruptiva.com', password: 'ilikeruptiva' }.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  end

end
