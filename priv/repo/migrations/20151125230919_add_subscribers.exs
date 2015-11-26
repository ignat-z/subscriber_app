defmodule SubscriberApp.Repo.Migrations.AddSubscribers do
  use Ecto.Migration

  def change do
    create table(:subscribers) do
      add :email, :string

      timestamps
    end
  end
end
