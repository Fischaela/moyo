defmodule MoyoWeb.PageController do
  use MoyoWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
