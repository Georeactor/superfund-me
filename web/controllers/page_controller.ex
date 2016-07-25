defmodule Superfundme.PageController do
  use Superfundme.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
