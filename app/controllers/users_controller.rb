class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

=begin
@api {get} /users Lista Usuários Cadastrados
@apiGroup Usuários
@apiHeader {String} access-token Token de usuário
@apiHeader {String} token-type Tipo de token de usuário
@apiHeaderExample {json} Header
  {"Authorization": "JWT xyz.abc.123.hgf"}
@apiSuccess {Object[]} users Lista de usuários registrados
@apiSuccess {Number} users.id Id de registro
@apiSuccess {String} users.provider Tipo de autenticação
@apiSuccess {String} users.uid Identificador único
@apiSuccess {Boolean} users.allow_password_change Permite mudar senha?
@apiSuccess {String} users.first_name Nome
@apiSuccess {String} users.last_name Sobrenome
@apiSuccess {Date} users.created_at Data de cadastro
@apiSuccess {Date} users.updated_at Última data de atualização
@apiSuccess {Date} users.deleted_at Data de exclusão
@apiSuccess {String} users.role Id do usuário
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

  def show
    @user = User.find(params[:id])
    authorize @user
    render json: @user
  end

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
    params.permit(:first_name, :last_name, :password, :password_confirmation)
  end

end