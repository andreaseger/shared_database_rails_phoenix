defmodule ExUsers.Router do
  use ExUsers.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ExUsers do
   pipe_through :api
   resources "/users", UserController
  end
end
