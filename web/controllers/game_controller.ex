defmodule Globalconq.GameController do
  use Globalconq.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
