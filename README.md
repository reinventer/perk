# Perk

Perk implements simple SDK for statistics data genereted by `gounter` application

## Install

Add gem into Gemfile:

`gem 'perk', git: 'git@github.com:reinventer/perk.git'`

Add initializer with connection:

```ruby
# config/initializers/perk.rb

Perk::Model.establish_connection(
    adapter:  'postgresql',
    host:     'localhost',
    database: 'gounter',
    username: 'user',
    password: 'secret'
)
```

## Usage

Getting all visits by period:

```ruby
visits = Perk.visits(1.month.ago)
```
