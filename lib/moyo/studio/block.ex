defmodule Moyo.Studio.Block do
  use Ecto.Schema
  import Ecto.Changeset
  alias Moyo.Studio.Block


  schema "blocks" do
    field :description, :string
    field :note, :string
    field :title, :string
    field :url, :string
    field :url_meta, :map
    field :created_by_user_id, :id
    field :last_edit_by_user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Block{} = block, attrs) do
    block
    |> cast(attrs, [:title, :url, :description, :note, :url_meta])
    # |> validate_required([])
  end
end
