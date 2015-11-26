defmodule SubscriberApp.Router.Subscription do
  use Maru.Router

  plug Plug.Logger

  alias SubscriberApp.Subscriber
  alias SubscriberApp.Repo

  namespace :subscription do
    desc "Provides subscribe ability for user"
    params do
      requires :email, type: String
    end
    put do
      changeset = Subscriber.changeset(%Subscriber{}, params)

      case Repo.insert(changeset) do
        {:ok, _} ->
          status 200
          %{ status: :ok }
        {:error, changeset} ->
          status 400
          changeset.errors |> Enum.into(%{})
      end
    end

    desc "Return all active subscribers"
    get do
      Subscriber |> Subscriber.active |> Repo.all
    end

    desc "Return how much subscribers for this day"
    get "/count" do
      count = Subscriber |> Subscriber.count |> Subscriber.this_day |> Repo.one
      %{ count: count }
    end

  end
end
