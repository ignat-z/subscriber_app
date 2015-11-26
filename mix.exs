defmodule SubscriberApp.Mixfile do
  use Mix.Project

  def project do
    [app: :subscriber_app,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications:
      (Mix.env == :dev && [:exsync] || []) ++
      [:logger, :maru, :postgrex, :ecto],
      mod: {SubscriberApp, []}]
  end

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
    [ { :maru,         "~> 0.8" },
      { :ecto,         "~> 1.0" },
      { :postgrex,     ">= 0.0.0" },
      { :poison,       "~> 1.5" },
      { :exsync,       "~> 0.1", only: :dev }
    ]
  end
end
