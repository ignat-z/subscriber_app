use Mix.Config

config :maru, SubscriberApp.API,
  http: [port: {:system, "PORT"}]

config :subscriber_app, SubscriberApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 20

config :exredis,
  url: System.get_env("REDISTOGO_URL"),
  reconnect: :no_reconnect,
  max_queue: :infinity
