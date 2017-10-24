defmodule MytodoWeb.TodoController do
  use MytodoWeb, :controller
  alias Mytodo.Todo
  alias Mytodo.Repo

  def index(conn, _params) do
  	conn
  	|> assign(:todos, Repo.all (Todo))
  	|> render("index.html")
  end

  def new(conn, _params) do
    changeset = Todo.changeset(%Todo{}, %{name: "Sample todo"})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"todo" => %{"name" => name}}) do
  	todo = %Mytodo.Todo{name: name}
  	Mytodo.Repo.insert(todo)

  	#text conn, "created todo"
  	redirect conn, to: todo_path(conn, :index)
  end

  def show(conn, %{"id" => id}) do 
    {id, _} = Integer.parse(id)
    conn
    |> assign(:todo, Repo.get(Todo, id))
    |> render("show.html")
  end
end
