defmodule CateringAppWeb.Router do
  use CateringAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug CateringAppWeb.Plugs.FetchSession
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CateringAppWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController
    resources "/events", EventController
    resources "/menus", MenuController, only: [:show, :update, :edit]
    resources "/sessions", SessionsController, only: [:create, :delete], singleton: true
  end

  # Other scopes may use custom stacks.
  # scope "/api", CateringAppWeb do
  #   pipe_through :api
  # end
end
