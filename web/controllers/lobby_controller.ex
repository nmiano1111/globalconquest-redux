defmodule Globalconq.LobbyController do
  use Globalconq.Web, :controller
  require Logger
  
  alias Globalconq.User

  def index(conn, _params) do
    render conn, "index.html"
  end
end
