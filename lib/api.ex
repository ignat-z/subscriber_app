defmodule Subscriber.API do
  use Maru.Router

  mount Subscriber.Router.Homepage

  rescue_from :all do
    status 500
    "Server Error"
  end
end