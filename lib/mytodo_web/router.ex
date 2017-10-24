defmodule MytodoWeb.Router do
  use MytodoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MytodoWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/todos", TodoController, :index
    get "/todos/new", TodoController, :new
    post "/todos", TodoController, :create
    get "/todos/:id", TodoController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", MytodoWeb do
  #   pipe_through :api
  # end
end
