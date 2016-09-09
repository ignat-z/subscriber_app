defmodule SubscriberApp.Supervisors.ListSupervisor do
  use Supervisor

  def start_link do
    result = {:ok, sup} = Supervisor.start_link(__MODULE__, [])
    start_workers(sup)
    result
  end

  def start_workers(sup) do
    {:ok, list_data} = Supervisor.start_child(sup, worker(ListData, []))
    Supervisor.start_child(sup, worker(SubscriberApp.Supervisors.ListSubSupervisor, [list_data]))
  end

  def init(_) do
    supervise([], strategy: :one_for_one)
  end
end