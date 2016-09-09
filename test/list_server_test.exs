defmodule ListServerTest do
  use ExUnit.Case

  setup do
    ListServer.start_link(nil)
    ListServer.clear
    :ok
  end

  test "it starts out empty" do
    assert ListServer.items == []
  end

  test "it let us add things to the list" do
    ListServer.add "book"
    assert ListServer.items == ["book"]
  end

  test "it let us remove things from the list" do
    ListServer.add "book"
    ListServer.add "magazine"
    ListServer.remove "book"
    assert ListServer.items == ["magazine"]
  end
end
