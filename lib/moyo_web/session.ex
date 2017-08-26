defmodule MoyoWeb.Session do
  @moduledoc """
  Helpers for session-related things
  """

  def current_user(conn), do: Guardian.Plug.current_resource(conn)
  def logged_in?(conn), do: Guardian.Plug.authenticated?(conn)

end
