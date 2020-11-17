defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :api do
    plug CORSPlug, [origin: "http://localhost:8080/"]
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug CORSPlug, [origin: "http://localhost:8080/"]
    plug Api.Guardian.AuthPipeline
  end

  scope "/api", ApiWeb do
    pipe_through :api
  end

  scope "/api", ApiWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    # resources "/users", UserController, only: [:create, :show]
    post "/sign_up", UserController, :create
    post "/sign_in", UserController, :sign_in
    #get "/clocks/:user_id", ClockController, :show_usersID
    resources "/clocks", ClockController, except: [:new, :edit]
    resources "/workingtimes", WorkingtimeController, except: [:new, :edit]
    resources "/roles", RoleController, except: [:new, :edit]
    # get "/workingtimes/:user_id/:workingtime_id", WorkingTimeController, :show_workingtimeWithUserId
  end

  scope "/api", ApiWeb do
    pipe_through [:api, :jwt_authenticated]

    get "/my_user", UserController, :show
    put "/my_user", UserController, :update
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
      live_dashboard "/dashboard", metrics: ApiWeb.Telemetry
    end
  end
end
