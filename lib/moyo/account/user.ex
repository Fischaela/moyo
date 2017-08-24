defmodule Moyo.Account.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Moyo.Account.User


  schema "users" do
    field :email, :string
    field :password_hash, :string 
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :password_hash])
    |> validate_required([:email, :password_hash])
  end
end
