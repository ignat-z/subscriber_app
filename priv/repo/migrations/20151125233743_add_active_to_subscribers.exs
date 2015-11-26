defmodule SubscriberApp.Repo.Migrations.AddActiveToSubscribers do
  use Ecto.Migration

  def change do
    alter table(:subscribers) do
      add :active, :boolean, default: :true
    end
  end
end
