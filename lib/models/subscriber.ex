defmodule SubscriberApp.Subscriber do
  use Ecto.Model

  import Ecto.Query
  import Ecto.Changeset

  @derive { Poison.Encoder, only: [:email] }

  schema "subscribers" do
    timestamps
    field :email
    field :active, :boolean, default: :true
  end

  def changeset(subscriber, params \\ :empty) do
    subscriber
    |> cast(params, ~w(email))
    |> unique_constraint(:email)
  end

  def active(query) do
    query |> where([subscribers], subscribers.active == true)
  end
end
