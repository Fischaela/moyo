defmodule Moyo.Repo.Migrations.CreateBlocks do
  use Ecto.Migration

  def change do
    create table(:blocks) do
      add :title, :text
      add :url, :text
      add :description, :text
      add :note, :text
      add :url_meta, :map
      add :created_by_user_id, references(:users, on_delete: :nothing)
      add :last_edit_by_user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:blocks, [:created_by_user_id])
    create index(:blocks, [:last_edit_by_user_id])
  end
end
