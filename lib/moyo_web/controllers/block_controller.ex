defmodule MoyoWeb.BlockController do
  use MoyoWeb, :controller

  alias Moyo.Repo
  alias Moyo.Studio
  alias Moyo.Studio.Block

  import MoyoWeb.Session

  def index(conn, _params) do
    # only what has no associated show
    blocks = Repo.all Block
    render conn, "index.html", blocks: blocks
  end

  def new(conn, _params) do
    block = Studio.change_block(%Block{})
    render conn, "new.html", block: block
  end

  def create(conn, %{"block" => block_params}) do
    case Studio.create_block(block_params, current_user(conn)) do
      {:ok, block} ->
        conn
        |> put_flash(:info, "Block created successfully.")
        |> redirect(to: inbox_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
