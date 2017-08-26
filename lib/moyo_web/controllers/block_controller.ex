defmodule MoyoWeb.BlockController do
  use MoyoWeb, :controller

  alias Moyo.Repo
  alias Moyo.Studio.Block

  def index(conn, _params) do
    # only what has no associated show
    blocks = Repo.all Block
    render conn, "index.html", blocks: blocks
  end
end
