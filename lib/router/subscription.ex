defmodule Subscriber.Router.Subscription do
  use Maru.Router
  plug Plug.Logger

  namespace :subscription do
    desc "Provides subscribe ability for user"
    params do
      requires :email, type: String
    end
    put do
      params |> IO.inspect
      end
  end
end
