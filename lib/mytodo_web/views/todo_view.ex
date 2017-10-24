defmodule MytodoWeb.TodoView do
  use MytodoWeb, :view

  def csrf_token(conn) do
  	Plug.Conn.get_session(conn, :csrf_token)
	end
end
