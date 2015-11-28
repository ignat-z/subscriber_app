use Mix.Config

config :maru, SubscriberApp.API,
  http: [port: {:system, "PORT"}]

config :subscriber_app, SubscriberApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 20

defmodule ExRedisConfiguration do
  def parse_db(nil), do: 0
  def parse_db("/"), do: 0
  def parse_db(path) do
    path |> String.split("/") |> Enum.at(1) |> String.to_integer
  end

  def parse_password(nil), do: ""
  def parse_password(auth) do
    auth |> String.split(":") |> Enum.at(1)
  end
end

if System.get_env("REDISTOGO_URL") do
  redis_info = URI.parse(System.get_env("REDISTOGO_URL"))
  config :exredis,
    host: redis_info.host,
    port: redis_info.port,
    password: redis_info.userinfo |> ExRedisConfiguration.parse_password,
    db: redis_info.path |> ExRedisConfiguration.parse_db,
    reconnect: :no_reconnect,
    max_queue: :infinity
end