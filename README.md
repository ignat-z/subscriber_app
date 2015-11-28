# SubscriberApp

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
