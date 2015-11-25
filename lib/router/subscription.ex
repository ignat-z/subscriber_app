defmodule Subscriber.Router.Subscription do
  use Maru.Router

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
