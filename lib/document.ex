defmodule Document do
  @redis_namespace "documents"
  import Exredis

  def all do
    start_link |> elem(1) |> query ["GET", "#{@redis_namespace}:all"]
  end
end
