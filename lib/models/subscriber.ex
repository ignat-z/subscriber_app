defmodule SubscriberApp.Subscriber do
  use Ecto.Model

  schema "subscribers" do
    timestamps
    field :email
  end
end
