defmodule Globalconq.Router do
  use Globalconq.Web, :router

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
  
  # https://medium.com/@andreichernykh/phoenix-simple-authentication-authorization-in-step-by-step-tutorial-form-dc93ea350153
  pipeline :with_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
    plug Globalconq.CurrentUser
  end

  pipeline :login_required do
  end

  pipeline :admin_required do
  end

  scope "/", Globalconq do
    pipe_through [:browser, :with_session] # Use the default browser stack
    
    resources "/users", UserController, only: [:show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]

    scope "/" do
      pipe_through [:login_required]
        # temporary!
        get "/globalconq", LobbyController, :index
        get "/game", GameController, :index
      
      scope "/admin", Admin, as: :admin do
        pipe_through [:admin_requiered]
      end
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", Globalconq do
  #   pipe_through :api
  # end
end
