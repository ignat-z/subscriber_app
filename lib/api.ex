defmodule SubscriberApp.API do
  use Maru.Router

  mount SubscriberApp.Router.List
  mount SubscriberApp.Router.Subscription
  mount SubscriberApp.Router.Subscribers
  mount SubscriberApp.Router.StaticDocuments

  before do
    plug Plug.Logger
    plug Plug.Parsers,
      pass: ["*/*"],
      json_decoder: Poison,
      parsers: [:urlencoded, :json, :multipart]
  end

  rescue_from :all, as: exception do
    conn
      |> put_status(500)
      |> text("ERROR: #{inspect exception}")
  end
end