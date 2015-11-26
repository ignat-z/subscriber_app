defmodule SubscriberApp.Repo.Migrations.AddUniqnessForEmails do
  use Ecto.Migration

  def change do
    create unique_index(:subscribers, [:email])
  end
end
