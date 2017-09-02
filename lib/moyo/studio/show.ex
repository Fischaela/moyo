defmodule Moyo.Studio.Show do
  use Ecto.Schema
  import Ecto.Changeset
  alias Moyo.Studio.{Show, Block}


  schema "shows" do
    field :title, :string

    has_many :blocks, Block

    timestamps()
  end

  @doc false
  def changeset(%Show{} = show, attrs) do
    show
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
