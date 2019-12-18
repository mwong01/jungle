# Jungle

A mini e-commerce application built with Rails 4.2.

# Screenshots
!["Main Homepage"](https://github.com/mwong01/jungle/blob/master/docs/1-main-products.png)
!["Main Homepage - Category View"](https://github.com/mwong01/jungle/blob/master/docs/2-main-categories.png)
!["My Cart"](https://github.com/mwong01/jungle/blob/master/docs/3-my-cart.png)
!["Order Confirmation"](https://github.com/mwong01/jungle/blob/master/docs/4-purchase-confirmation.png)

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
Alternatively, use Credit Card # 4242 4242 4242 4242, with CVC as any three digits and Expiration Date as any future date. 

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
