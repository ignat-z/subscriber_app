defmodule SubscriberApp.API do
  use Maru.Router

  mount SubscriberApp.Router.Subscription
  mount SubscriberApp.Router.Subscribers

  rescue_from :all, as: exception do
    status 500
    "ERROR: #{inspect exception}"
  end
end