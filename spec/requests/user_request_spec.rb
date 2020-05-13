require 'rails_helper'
include ActionController::RespondWith

RSpec.describe "Users", type: :request do
  describe "Rotas: Users" do
    let!(:usuario) do
      @userA = create(:user)
      @userB = create(:user, first_name: 'Fernando', last_name: 'Moraes', email: 'fernando.moraes@ruptiva.com', role: :user)
      @userC = create(:user, first_name: 'Cátia', last_name: 'Abreu', email: 'catia.abreu@ruptiva.com', role: :user)
    end

    context "quando o usuário é do tipo 'ADMIN'" do
      describe "POST /auth" do
        describe "status 200" do
          it "cria um novo usuário" do
            post "/auth", params:  {
                "first_name": "João",
                "last_name": "da Silva",
                "email": "joao@email.com",
                "password": "12345678",
                "password_confirmation": "12345678"
            }
            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body)['data']['email']).to eql("joao@email.com")
          end
        end
      end

      describe "GET /users" do
        describe "status 200" do

          it "retorna todos os usuários cadastrados" do
            auth_params = faz_login_de_usuario(@userA)
            get '/users', headers: auth_params

            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body).size()).to eq(3)
          end
        end
      end

      describe "GET /users/1" do
        describe "status 200" do
          it "retorna os dados do usuário Maikel" do
            auth_params = faz_login_de_usuario(@userA)

            get '/users/1', headers: auth_params
            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body)['first_name']).to eql("Maikel")
            expect(JSON.parse(response.body)['last_name']).to eql("Bald")
            expect(JSON.parse(response.body)['email']).to eql("maikel@ruptiva.com")
          end
        end
      end

      describe 'GET /users/3' do
        describe "status 200" do
          it "retorna os dados da usuária Cátia" do
            auth_params = faz_login_de_usuario(@userA)

            get '/users/3', headers: auth_params
            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body)['first_name']).to eql("Cátia")
            expect(JSON.parse(response.body)['last_name']).to eql("Abreu")
            expect(JSON.parse(response.body)['email']).to eql("catia.abreu@ruptiva.com")
          end
        end
      end
    end

    describe 'PUT /users/3' do
      describe "status 204" do
        it "atualiza os dados do usuário" do
          auth_params = faz_login_de_usuario(@userC)

          put '/users/3', headers: auth_params, params: { 'first_name': 'Theobaldo', 'last_name': 'Vasconcelos'}
          expect(response).to have_http_status(204)

          get '/users/3', headers: auth_params
          expect(JSON.parse(response.body)['first_name']).to eql("Theobaldo")
          expect(JSON.parse(response.body)['last_name']).to eql("Vasconcelos")
        end
      end
    end


    describe 'DELETE /auth' do
      describe "status 200" do
        it "faz soft-delete do usuário após o mesmo ter logado" do
         auth_params = faz_login_de_usuario(@userB)
         delete '/auth/', headers: auth_params

         expect(response).to have_http_status(:success)
        end
      end
    end
  end


  def faz_login_de_usuario(user)
    login(user)
    auth_params = get_auth_params_from_login_response_headers(response)
  end

  def login(user)
    post "/auth/sign_in", params:  { email: user.email, password: user.password }.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  end

  def get_auth_params_from_login_response_headers(response)
    client = response.headers['client']
    token = response.headers['access-token']
    expiry = response.headers['expiry']
    token_type = response.headers['token-type']
    uid = response.headers['uid']

    auth_params = {
        'access-token' => token,
        'client' => client,
        'uid' => uid,
        'expiry' => expiry,
        'token-type' => token_type
    }
    auth_params
  end

end
