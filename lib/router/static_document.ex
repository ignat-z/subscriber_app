defmodule SubscriberApp.Router.StaticDocuments do
  use Maru.Router

  plug Plug.Logger

  namespace :static_documents do
    desc "Return document from redis"
    get do
      Document.all
    end
  end
end
