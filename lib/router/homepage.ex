defmodule Subscriber.Router.Homepage do
  use Maru.Router

  get do
    %{ hello: :world }
  end
end
