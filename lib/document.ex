defmodule Document do
  @redis_namespace "documents"

  def all do
    :redis_connection |> Exredis.query(["GET", "#{@redis_namespace}:all"])
  end
end
