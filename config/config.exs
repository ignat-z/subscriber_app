use Mix.Config
config :subscriber_app, ecto_repos: [SubscriberApp.Repo]
import_config "#{Mix.env}.exs"
