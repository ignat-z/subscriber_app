defmodule HealtCheck do
  def check(urls_list) do
    urls_list
      |> Enum.map(fn(url) ->
        Task.async(fn -> url |> check_url end)
      end)
      |> Enum.map(&Task.await/1)
  end

  def check_url(url) do
    status = url |> HTTPotion.get |> HTTPotion.Response.success?
    result = case status do
      true -> :ok
      _    -> :not_ok
    end
    {url, result}
  end
end
