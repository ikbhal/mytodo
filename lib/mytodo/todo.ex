defmodule Mytodo.Todo do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mytodo.Todo


  schema "todos" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Todo{} = todo, attrs) do
    todo
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

end
