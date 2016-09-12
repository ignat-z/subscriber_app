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
      requires :url,       type: String
    end
    post "/" do
      result = ListServer.add(params.url)
      conn
        |> json(result)
    end

    desc "Check urls from list"
    get "/check" do
      result = ListServer.items |> HealtCheck.check |> Enum.into(%{})
      conn
        |> json(result)
    end
  end
end
