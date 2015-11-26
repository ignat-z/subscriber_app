defmodule SubscriberApp.Router.Subscribers do
  use Maru.Router

  plug Plug.Logger

  alias SubscriberApp.Subscriber
  alias SubscriberApp.Repo

  namespace :subscribers do
    desc "Return all active subscribers"
    get "/all" do
      Subscriber |> Subscriber.active |> Repo.all
    end

    desc "Return how much subscribers for this day"
    get "/today_subscribed" do
      count = Subscriber |> Subscriber.count |> Subscriber.this_day |> Repo.one
      %{ count: count }
    end
  end
end
