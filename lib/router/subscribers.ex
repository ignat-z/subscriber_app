defmodule SubscriberApp.Router.Subscribers do
  use Maru.Router

  plug Plug.Logger

  alias SubscriberApp.Subscriber
  alias SubscriberApp.Repo

  namespace :subscribers do
    desc "Return all active subscribers"
    params do
      optional :page,       type: Integer
      optional :page_size,  type: Integer,  default: 10
    end
    get "/all" do
      page = Subscriber
        |> Subscriber.active
        |> Repo.paginate(page: params.page, page_size: params.page_size)

      %{
        subscribers:   page.entries,
        page_number:   page.page_number,
        page_size:     page.page_size,
        total_pages:   page.total_pages,
        total_entries: page.total_entries
      }
    end

    desc "Return how much subscribers for this day"
    get "/today_subscribed" do
      count = Subscriber
        |> Subscriber.count
        |> Subscriber.this_day
        |> Repo.one
      %{ count: count }
    end
  end
end
