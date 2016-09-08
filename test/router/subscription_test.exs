defmodule SubscribersTest do
  use ExUnit.Case, async: true
  use Maru.Test, for: SubscriberApp.Router.Subscribers

  alias SubscriberApp.Subscriber

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(SubscriberApp.Repo)
    {:ok, %{conn: build_conn()} }
  end

  test "/" do
    SubscriberApp.Repo.insert!(%Subscriber{email: "iddqd@mail.ru"})
    result = get("/subscribers/all") |> json_response

    assert 1 = Map.get(result, "page_number")
    assert 10 = Map.get(result, "page_size")
    assert 1 = Map.get(result, "total_entries")
    assert [%{"email" => "iddqd@mail.ru"}] = Map.get(result, "subscribers")
  end

  test "/ with params", %{conn: conn} do
    SubscriberApp.Repo.insert!(%Subscriber{email: "iddqd1@mail.ru"})
    SubscriberApp.Repo.insert!(%Subscriber{email: "iddqd2@mail.ru"})
    SubscriberApp.Repo.insert!(%Subscriber{email: "iddqd3@mail.ru"})

    result = conn
      |> put_body_or_params(%{page: 1, page_size: 2})
      |> get("/subscribers/all")
      |> json_response

    assert 2 = Map.get(result, "page_size")
    assert 1 = Map.get(result, "page_number")
    assert 3 = Map.get(result, "total_entries")
    assert [%{"email" => "iddqd1@mail.ru"}, %{"email" => "iddqd2@mail.ru"}] = Map.get(result, "subscribers")
  end
end