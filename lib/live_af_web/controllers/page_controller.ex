defmodule LiveAfWeb.PageController do
  use LiveAfWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
