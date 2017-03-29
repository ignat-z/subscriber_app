ExUnit.start()

Mix.Task.run "ecto.create", ~w(-r SubscriberApp.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r SubscriberApp.Repo --quiet)
Ecto.Adapters.SQL.Sandbox.mode(SubscriberApp.Repo, :manual)
Maru.Test.start()
