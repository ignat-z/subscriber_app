defmodule Subscriber do
end

defmodule Subscriber.Router.Homepage do
  use Maru.Router

  get do
    %{ hello: :world }
  end
end

defmodule Subscriber.API do
  use Maru.Router

  mount Subscriber.Router.Homepage

  rescue_from :all do
    status 500
    "Server Error"
  end
end