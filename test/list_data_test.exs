defmodule ListDataTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, pid} = ListData.start_link
    {:ok, %{pid: pid}}
  end

  test "it default state is empty array", %{pid: pid} do
    assert ListData.get_state(pid) == []
  end

  test "it saveas passed state", %{pid: pid} do
    ListData.save_state(pid, :some_state)
    assert ListData.get_state(pid) == :some_state
  end
end
