use Mix.Config

config :subscriber, Subscriber.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "subscriber_development",
  username: "postgres",
  password: "root",
  hostname: "localhost"
