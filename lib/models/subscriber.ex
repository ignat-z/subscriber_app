defmodule SubscriberApp.Subscriber do
  use Ecto.Schema

  import Ecto.Query
  import Ecto.Changeset

  @derive {Poison.Encoder, only: [:email]}

  schema "subscribers" do
    timestamps()
    field :email
    field :active, :boolean, default: :true
  end

  def changeset(subscriber, params \\ :empty) do
    subscriber
    |> cast(params, ~w(email))
    |> validate_required(:email)
    |> validate_format(:email, ~r/.+\@.+\..+/)
    |> unique_constraint(:email)
  end

  def active(query) do
    query |> where([subscribers], subscribers.active == true)
  end

  def count(query) do
    query |> select([subscribers], count("*"))
  end

  def this_day(query) do
    query |> where([subscribers],
      subscribers.inserted_at > date_add(subscribers.inserted_at, -1, "day"))
  end
end
