use Mix.Config

config :logger, level: :info

config :maru, SubscriberApp.API,
  http: [port: 8880],
  test: true

config :subscriber_app, SubscriberApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: {:system, "DATABASE_URL"},
  pool: Ecto.Adapters.SQL.Sandbox

config :exredis,
  host: "127.0.0.1",
  port: 6379,
  password: "",
  db: 0,
  reconnect: :no_reconnect,
  max_queue: :infinity

config :subscriber_app, ecto_repos: [SubscriberApp.Repo]
