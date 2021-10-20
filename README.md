# Jungle

A mini e-commerce application built with Rails 4.2. 


## Home page 
!["Screenshot of URLs main page"](https://github.com/PolinaSkrobot/jungle-rails/blob/master/public/main_page.jpeg)
## Order confirmation page
!["Screenshot of URLs order page"](https://github.com/PolinaSkrobot/jungle-rails/blob/master/public/order.jpeg)
## Admin authorization with using HTTP Basic Auth 
!["Screenshot of URLs admin authorization fearure"](https://github.com/PolinaSkrobot/jungle-rails/blob/master/public/Admin-authorization.jpeg)
## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Sass-rails, ~> 5.0
* Jquery-rails
* Jbuilder, ~> 2.0
* Bcrypt, ~> 3.1.7
* puma
* bootstrap-sass, ~> 3.3.6
* font-awesome-rail
* money-rails
* carrierwave
* rmagick
* faker
* rspec-rails, ~> 3.5
* capybara

