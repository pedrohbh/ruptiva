class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

=begin
@api {get} /users Lista Usuários Cadastrados
@apiGroup Usuários
@apiHeader {String} access-token Token de usuário
@apiHeader {String} token-type Tipo de token de usuário
@apiHeader {String} client Token de cliente
@apiHeader {String} expiry Data na qual a sessão de usário expirará
@apiHeader {String} uid Identificador único de usuário
@apiHeaderExample {json} Header
  {
    "access-token": "wwwww",
    "token-type":   "Bearer",
    "client":       "xxxxx",
    "expiry":       "yyyyy",
    "uid":          "zzzzz"
  }
@apiSuccess {Object[]} users Lista de usuários registrados
@apiSuccess {Number} users.id Id de registro
@apiSuccess {String} users.provider Tipo de autenticação
@apiSuccess {String} users.uid Identificador único
@apiSuccess {Boolean} users.allow_password_change Permite mudar senha?
@apiSuccess {String} users.first_name Nome
@apiSuccess {String} users.last_name Sobrenome
@apiSuccess {String} users.email Email
@apiSuccess {Date} users.created_at Data de cadastro
@apiSuccess {Date} users.updated_at Última data de atualização
@apiSuccess {Date} users.deleted_at Data de exclusão
@apiSuccess {String} users.role Nível de acesso do usuário
@apiSuccessExample {json} Sucesso
HTTP/1.1 200 OK
  [
    {
        "id": 1,
        "provider": "email",
        "uid": "Maikel",
        "allow_password_change": false,
        "first_name": "Maikel",
        "last_name": "Bald",
        "email": "maikel@ruptiva.com",
        "created_at": "2020-05-12T14:19:49.192Z",
        "updated_at": "2020-05-12T14:21:39.531Z",
        "deleted_at": null,
        "role": "admin"
    },
    {
        "id": 2,
        "provider": "email",
        "uid": "joao8@email.com",
        "allow_password_change": false,
        "first_name": "João",
        "last_name": "da Silva",
        "email": "joao@email.com",
        "created_at": "2020-05-12T14:25:56.653Z",
        "updated_at": "2020-05-12T14:25:56.960Z",
        "deleted_at": null,
        "role": "user"
    }]
=end
  def index
    @user = User.all
    authorize User
    render json: @user
  end


=begin
@api {get} /users/:id Exibe um usuário
@apiGroup Usuários
@apiHeader {String} access-token Token de usuário
@apiHeader {String} token-type Tipo de token de usuário
@apiHeader {String} client Token de cliente
@apiHeader {String} expiry Data na qual a sessão de usário expirará
@apiHeader {String} uid Identificador único de usuário
@apiHeaderExample {json} Header
  {
    "access-token": "wwwww",
    "token-type":   "Bearer",
    "client":       "xxxxx",
    "expiry":       "yyyyy",
    "uid":          "zzzzz"
  }
@apiParam {id} id Id do usuário
@apiSuccess {Number} id Id de registro
@apiSuccess {String} provider Tipo de autenticação
@apiSuccess {String} uid Identificador único
@apiSuccess {Boolean} allow_password_change Permite mudar senha?
@apiSuccess {String} first_name Nome
@apiSuccess {String} last_name Sobrenome
@apiSuccess {String} email Email
@apiSuccess {Date} created_at Data de cadastro
@apiSuccess {Date} updated_at Última data de atualização
@apiSuccess {Date} deleted_at Data de exclusão
@apiSuccess {String} role Nível de acesso do usuário
@apiSuccessExample {json} Sucesso
 HTTP/1.1 200 OK
  {
        "id": 1,
        "provider": "email",
        "uid": "Maikel",
        "allow_password_change": false,
        "first_name": "Maikel",
        "last_name": "Bald",
        "email": "maikel@ruptiva.com",
        "created_at": "2020-05-12T14:19:49.192Z",
        "updated_at": "2020-05-12T14:21:39.531Z",
        "deleted_at": null,
        "role": "admin"
    }
=end
  def show
    @user = User.find(params[:id])
    authorize @user
    render json: @user
  end

=begin
@api {put} /users/:id Atualiza um usuário
@apiGroup Usuários
@apiHeader {String} access-token Token de usuário
@apiHeader {String} token-type Tipo de token de usuário
@apiHeader {String} client Token de cliente
@apiHeader {String} expiry Data na qual a sessão de usário expirará
@apiHeader {String} uid Identificador único de usuário
@apiHeaderExample {json} Header
{
    "access-token": "wwwww",
    "token-type":   "Bearer",
    "client":       "xxxxx",
    "expiry":       "yyyyy",
    "uid":          "zzzzz"
}
@apiParam {id} id Id do usuário
@apiParam {String} first_name Nome
@apiParam {String} last_name Sobrenome
@apiParamExample {json} Entrada
{
        "first_name": "Maikel",
        "last_name": "Bald",
}
@apiSuccessExample {json} Sucesso
    HTTP/1.1 204 No Content
=end
  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      render status: 204
    else
      render json: @user.errors, status: 412
    end
  end

  private
  def user_params
    params.permit(:first_name, :last_name )
  end

end
