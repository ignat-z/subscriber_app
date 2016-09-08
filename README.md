# SubscriberApp

[![Circle
CI](https://circleci.com/gh/ignat-zakrevsky/subscriber_app/tree/master.svg?style=svg)](https://circleci.com/gh/ignat-zakrevsky/subscriber_app/tree/master)

PoC Elixir Application

## Deploy

### Create a Heroku app with this buildpack
```
heroku create --buildpack "https://github.com/HashNuke/heroku-buildpack-elixir.git"
```

### Adding addons
```
heroku addons:create redistogo:nano
heroku addons:create heroku-postgresql:hobby-dev
```

### Preparing database
You don't need run `heroku run mix ecto.create`
```
heroku run mix ecto.migrate
````

### Development
```
iex -S mix                       # run development server
mix deps.get                     # dependencies
mix do ecto.create, ecto.migrate # db tasks
mix test                         # run tests
mix credo --ignore readability   # run linter
```
