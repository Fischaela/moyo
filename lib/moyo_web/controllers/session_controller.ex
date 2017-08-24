defmodule MoyoWeb.SessionController do
  use MoyoWeb, :controller

  import Comeonin.Argon2, only: [checkpw: 2]

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    user = Moyo.Repo.get_by Moyo.Account.User, email: email
    valid = checkpw(password, user.password_hash)

    if valid do
      conn
      |> Guardian.Plug.sign_in(user)
      |> redirect(to: "/")
    else
      render conn, "index.html"
    end
  end

  def delete(conn, _params) do
    conn
    |> Guardian.Plug.sign_out
    |> put_flash(:info, "Logged out")
    |> redirect(to: "/")
  end
end
