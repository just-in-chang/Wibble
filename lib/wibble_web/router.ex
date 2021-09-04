defmodule WibbleWeb.Router do
  use WibbleWeb, :router

  pipeline :api do
    plug CORSPlug
    plug :accepts, ["json"]
  end

  scope "/api", WibbleWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/jobs", JobController, except: [:new, :edit]
    post "/users/login", UserController, :login
    get "/users/jobs/:id", JobController, :jobs

    options "/users", UserController, :options
    options "/jobs", JobController, :options
    options "/users/login", UserController, :options
    options "/users/jobs/:id", JobController, :options
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: WibbleWeb.Telemetry
    end
  end
end
