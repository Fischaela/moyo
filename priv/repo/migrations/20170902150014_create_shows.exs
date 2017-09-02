defmodule Moyo.Repo.Migrations.CreateShows do
  use Ecto.Migration

  def change do
    create table(:shows) do
      add :title, :string

      timestamps()
    end

  end
end
