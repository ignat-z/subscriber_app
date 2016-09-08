defmodule SubscriberApp.Router.Subscription do
  use Maru.Router

  alias SubscriberApp.Subscriber
  alias SubscriberApp.Repo

  desc "Provides subscribe ability for user"
  params do
    requires :email, type: String
  end
  put "/subscribe" do
    subscriber = Subscriber |> Repo.get_by(email: params[:email])

    if subscriber do
      Repo.update!(%{subscriber | active: true})
      %{status: :ok}
    else
      changeset = Subscriber.changeset(%Subscriber{}, params)
      case Repo.insert(changeset) do
        {:ok, _} ->
          conn
            |> json(%{status: :ok})
        {:error, changeset} ->
          conn
            |> put_status(400)
            |> json(%{status: :error, reason: changeset.errors |> Enum.into(%{})})
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
      Repo.update!(%{subscriber | active: false})
      conn
        |> json(%{status: :ok})
    else
      conn
        |> put_status(400)
        |> json(%{status: :error, reason: "Can't find such subscriber"})
    end
  end
end
