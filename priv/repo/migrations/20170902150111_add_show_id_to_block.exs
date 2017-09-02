defmodule Moyo.Repo.Migrations.AddShowIdToBlock do
  use Ecto.Migration

  def change do
    alter table(:blocks) do
      add :show_id, references(:shows, on_delete: :nothing)
    end
  end
end
