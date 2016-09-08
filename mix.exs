defmodule SubscriberApp.Mixfile do
  use Mix.Project

  def project do
    [app: :subscriber_app,
     version: "0.0.1",
     elixir: "~> 1.3.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: applications(Mix.env), mod: {SubscriberApp, []}]
  end

  def applications(:dev), do: applications(:default) ++ [:exsync]
  def applications(_),    do: [:logger, :maru, :postgrex, :ecto]

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [ { :maru,         "~> 0.10" },
      { :ecto,         "~> 2.0" },
      { :scrivener,    "~> 2.1.1" },
      { :postgrex,     ">= 0.0.0" },
      { :exredis,      ">= 0.2.3" },
      { :poison,       "~> 2.2.0" },
      { :exsync,       "~> 0.1", only: :dev }
    ]
  end
end
