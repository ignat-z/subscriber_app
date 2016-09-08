defmodule SubscriberApp.API do
  use Maru.Router

  mount SubscriberApp.Router.Subscription
  mount SubscriberApp.Router.Subscribers
  mount SubscriberApp.Router.StaticDocuments

  rescue_from :all, as: exception do
    conn
      |> put_status(500)
      |> text("ERROR: #{inspect exception}")
  end
end