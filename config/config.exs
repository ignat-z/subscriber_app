use Mix.Config
import_config "#{Mix.env}.exs"
config :maru, SubscriberApp.API,
  http: [port: 8880]
