use Mix.Config
import_config "#{Mix.env}.exs"
config :maru, Subscriber.API,
  http: [port: 8880]
