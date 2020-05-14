# Projeto Ruptiva

## Introdução
Este projeto é a solução resposta para o Ruptiva - Code Challenge Back-end, disponível neste [link](https://github.com/ruptiva/Ruptiva-Code-Challenge-Back-end)

## Gemas Extras Utilizadas
- [paranoia](https://github.com/rubysherpas/paranoia) - Gema que implementa a parte de soft-delete para o método destroy
- [FactoryGirl](https://github.com/salimane/factory_girl_rails) - Gema que subistitui fixtures para criação de instâncias para testes
- [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner) - Gema utilizada para facilitar a escrita de códigos de testes em que limpa o banco de testes antes da execução dos mesmos

## Forma de Execução
### Requisitos
Necessário ter:
- ruby '2.6.3'
- rails 6
- sqllite3

### Passos de execução
1 - Clone o projeto para o seu computador;
```
git clone https://github.com/pedrohbh/ruptiva.git
```

2 - Dentro da raíz do projeto, execute o "bundle install" para instalar as dependências(gemas) do projeto;
```
bundle install
```

3 - Execute os códigos de migração;
```
rake db:migrate
```

4 - Execute a semeação de dados;
```
rails db:seed
```

5 - Execute o servidor.
```
rails server
```

### Execução de testes unitários
Para executar os testes unitários, execute na raíz do projeto:
```
bundle exec rspec
```

Caso deseje que o resultado dos testes sejam apresentados com a descriçao de cada, execute na raíz do projeto:
```
rspec --format d
```
