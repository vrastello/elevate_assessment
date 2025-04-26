# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 3.3.5

* System dependencies: postgresql, you will need to [download](https://www.postgresql.org/download/) to run server

* Database initialization: `rails db:create, rails db:migrate`

* How to run the test suite: `bundle exec rspec`

* Deployment instructions: 
  * add master.key file included in submission to config folder so credentials will work
  * `cd elevate && rails server`

Notes: 

* I approached this as if we will eventually have multiple billing subscriptions for users, the service classes are designed with the intention to easily add more subscription clients and services
* The first subscription was named "abc" as an example
* If no user is found in subscriptions service we return nil for subscription_status (the description didn't say but I think that is useful response)
* I went ahead and made game_events to belong to users so you can count the events
* The authorization and session method is JWT, the secret key is in the credentials file, the api_key for the billing service is also in the credentials file.

