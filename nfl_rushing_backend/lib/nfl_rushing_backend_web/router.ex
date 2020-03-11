defmodule NflRushingBackendWeb.Router do
  use NflRushingBackendWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_live_layout, {NflRushingBackendWeb.LayoutView, :app}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", NflRushingBackendWeb do
    pipe_through :browser

    get "/download_csv", CSVController, :export
    live "/live/players", PlayersLive
  end

  scope "/api" do
    pipe_through :api

    if Mix.env() == :dev do
      forward "/graphiql", Absinthe.Plug.GraphiQL,
        schema: NflRushingBackendWeb.Schema,
        interface: :playground
    end

    forward "/graphql", Absinthe.Plug, schema: NflRushingBackendWeb.Schema
  end
end
