defmodule PhxGenHtmlJsonWeb.Router do
  use PhxGenHtmlJsonWeb, :router

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

  scope "/", PhxGenHtmlJsonWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/posts", PostController
  end

  scope "/api", PhxGenHtmlJsonWeb.Api, as: :api do
    pipe_through :api

    resources "/posts", PostController
  end
end
