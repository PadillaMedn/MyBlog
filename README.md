# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* primer paso clonar el proyecto 

*luego cambiar la configuracion en gemfile comentar  o eliminar esta parte:

 group :production do
  gem 'pg'
 end
 
 y colocar 
 
 gem 'sqlite3' 
 
 despues ejecutar bundle install

luego en config => database.yml

cambiar el adapter de postgresql a sqlite3

correr el servidor para revisar que este funcionando correctamente
