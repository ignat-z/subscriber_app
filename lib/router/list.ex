defmodule SubscriberApp.Router.List do
  use Maru.Router

  namespace :list do
    desc "Return list elements"
    get "/" do
      conn
        |> json(ListServer.items)
    end

    desc "Add element to list"
    params do
      requires :item,       type: String
    end
    post "/" do
      result = ListServer.add(params.item)
      conn
        |> json(result)
    end
  end
end
