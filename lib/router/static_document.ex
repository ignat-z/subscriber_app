defmodule SubscriberApp.Router.StaticDocuments do
  use Maru.Router

  plug Plug.Logger

  namespace :static_documents do
    desc "Return document from redis"
    get do
      document = Document.all
      case document do
        :undefined -> %{}
        _ -> document
      end
    end
  end

end
