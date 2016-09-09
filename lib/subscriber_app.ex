defmodule SubscriberApp do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(SubscriberApp.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: SubscriberApp.Supervisor]
    Supervisor.start_link(children, opts)
    SubscriberApp.Supervisors.ListSupervisor.start_link
  end
end
