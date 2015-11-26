defmodule SubscriberApp.Router.Subscription do
  use Maru.Router

  plug Plug.Logger

  alias SubscriberApp.Subscriber
  alias SubscriberApp.Repo

  desc "Provides subscribe ability for user"
  params do
    requires :email, type: String
  end
  put "/subscribe" do
    subscriber = Subscriber |> Repo.get_by(email: params[:email])

    if subscriber do
      Repo.update!(%{ subscriber | active: true })
      %{ status: :ok }
    else
      changeset = Subscriber.changeset(%Subscriber{}, params)
      case Repo.insert(changeset) do
        { :ok, _ } ->
          status 200
          %{ status: :ok }
        { :error, changeset } ->
          status 400
          %{ status: :error, reason: changeset.errors |> Enum.into(%{}) }
      end
    end
  end

  desc "Provides unsubscribe ability for user"
  params do
    requires :email, type: String
  end
  put "/unsubscribe" do
    subscriber = Subscriber |> Repo.get_by(email: params[:email])

    if subscriber do
      Repo.update!(%{ subscriber | active: false })
      %{ status: :ok }
    else
      status 400
      %{ status: :error, reason: "Can't find such subscriber" }
    end
  end

  namespace :subscription do
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
