use Mix.Config

config :subscriber_app, SubscriberApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "subscriber_development",
  username: "postgres",
  password: "root",
  hostname: "localhost"
