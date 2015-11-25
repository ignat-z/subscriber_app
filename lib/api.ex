defmodule Subscriber.API do
  use Maru.Router

  mount Subscriber.Router.Subscription

  rescue_from :all, as: exception do
    status 500
    "ERROR: #{inspect exception}"
  end
end