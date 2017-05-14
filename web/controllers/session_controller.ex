defmodule Globalconq.SessionController do
  use Globalconq.Web, :controller
  
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  alias Globalconq.User

  plug :scrub_params, "session" when action in ~w(create)a

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"email" => email,
                                     "password" => password}}) do
    case Globalconq.Auth.login_by_email_and_pass(conn, email, password) do
      {:ok, conn} ->
        conn
        |> redirect(to: lobby_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid email/pass combo")
        |> render("new.html")
      end
  end
  
  def delete(conn, _) do
    conn
    |> Globalconq.Auth.logout
    |> put_flash(:info, "See you later!")
    |> redirect(to: lobby_path(conn, :index))
  end
end
