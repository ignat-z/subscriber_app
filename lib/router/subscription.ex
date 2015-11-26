defmodule SubscriberApp.Router.Subscription do
  use Maru.Router
  plug Plug.Logger
  import Ecto.Query
  alias SubscriberApp.Subscriber

  namespace :subscription do
    desc "Provides subscribe ability for user"
    params do
      requires :email, type: String
    end
    put do
      params |> IO.inspect
    end

    desc "Return all active subscribers"
    get do
      Subscriber |> Subscriber.active |> SubscriberApp.Repo.all
    end
  end
end
