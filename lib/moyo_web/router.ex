defmodule MoyoWeb.Router do
  use MoyoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :browser_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
    # plug Auth.Plug.SetCurrentUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MoyoWeb do
    pipe_through [:browser , :browser_session]

    get "/", PageController, :index

    get "/inbox", BlockController, :index, as: :inbox
    resources "/blocks", BlockController, only: [:new, :create]

    resources "/users", UserController, only: [:new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", MoyoWeb do
  #   pipe_through :api
  # end
end
