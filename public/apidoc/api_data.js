define({ "api": [
  {
    "type": "get",
    "url": "/users",
    "title": "Lista Usuários Cadastrados",
    "group": "Usuários",
    "header": {
      "fields": {
        "Header": [
          {
            "group": "Header",
            "type": "String",
            "optional": false,
            "field": "access-token",
            "description": "<p>Token de usuário</p>"
          },
          {
            "group": "Header",
            "type": "String",
            "optional": false,
            "field": "token-type",
            "description": "<p>Tipo de token de usuário</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Header",
          "content": "{\"Authorization\": \"JWT xyz.abc.123.hgf\"}",
          "type": "json"
        }
      ]
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object[]",
            "optional": false,
            "field": "users",
            "description": "<p>Lista de usuários registrados</p>"
          },
          {
            "group": "Success 200",
            "type": "Number",
            "optional": false,
            "field": "users.id",
            "description": "<p>Id de registro</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "users.provider",
            "description": "<p>Tipo de autenticação</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "users.uid",
            "description": "<p>Identificador único</p>"
          },
          {
            "group": "Success 200",
            "type": "Boolean",
            "optional": false,
            "field": "users.allow_password_change",
            "description": "<p>Permite mudar senha?</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "users.first_name",
            "description": "<p>Nome</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "users.last_name",
            "description": "<p>Sobrenome</p>"
          },
          {
            "group": "Success 200",
            "type": "Date",
            "optional": false,
            "field": "users.created_at",
            "description": "<p>Data de cadastro</p>"
          },
          {
            "group": "Success 200",
            "type": "Date",
            "optional": false,
            "field": "users.updated_at",
            "description": "<p>Última data de atualização</p>"
          },
          {
            "group": "Success 200",
            "type": "Date",
            "optional": false,
            "field": "users.deleted_at",
            "description": "<p>Data de exclusão</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "users.role",
            "description": "<p>Id do usuário</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Sucesso",
          "content": "HTTP/1.1 200 OK\n  [\n    {\n        \"id\": 1,\n        \"provider\": \"email\",\n        \"uid\": \"Maikel\",\n        \"allow_password_change\": false,\n        \"first_name\": \"Maikel\",\n        \"last_name\": \"Bald\",\n        \"email\": \"maikel@ruptiva.com\",\n        \"created_at\": \"2020-05-12T14:19:49.192Z\",\n        \"updated_at\": \"2020-05-12T14:21:39.531Z\",\n        \"deleted_at\": null,\n        \"role\": \"admin\"\n    },\n    {\n        \"id\": 2,\n        \"provider\": \"email\",\n        \"uid\": \"joao8@email.com\",\n        \"allow_password_change\": false,\n        \"first_name\": \"João\",\n        \"last_name\": \"da Silva\",\n        \"email\": \"joao@email.com\",\n        \"created_at\": \"2020-05-12T14:25:56.653Z\",\n        \"updated_at\": \"2020-05-12T14:25:56.960Z\",\n        \"deleted_at\": null,\n        \"role\": \"user\"\n    }]",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "app/controllers/users_controller.rb",
    "groupTitle": "Usuários",
    "name": "GetUsers"
  }
] });
