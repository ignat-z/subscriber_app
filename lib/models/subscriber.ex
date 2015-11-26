defmodule SubscriberApp.Subscriber do
  use Ecto.Model
  import Ecto.Query
  @derive { Poison.Encoder, only: [:email] }

  schema "subscribers" do
    timestamps
    field :email
    field :active, :boolean, default: :true
  end

  def active(query) do
    query |> where([subscribers], subscribers.active == true)
  end
end
