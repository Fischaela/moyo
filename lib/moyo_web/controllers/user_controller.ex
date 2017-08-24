defmodule MoyoWeb.UserController do
  use MoyoWeb, :controller

  alias Moyo.Account
  alias Moyo.Account.User

  def new(conn, _params) do
    changeset = Account.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end
end
