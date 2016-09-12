defmodule ListTest do
  use ExUnit.Case, async: true
  use Maru.Test, for: SubscriberApp.Router.List

  setup do
    ListServer.clear
    :ok
  end

  test "POST /" do
    result = build_conn()
      |> put_body_or_params(%{url: "https://httpbin.org/get"})
      |> post("/list")
      |> json_response
    assert "ok" = result
  end

  test "GET /" do
    result = get("/list") |> json_response
    assert [] = result
  end
end
