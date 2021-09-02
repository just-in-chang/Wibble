defmodule Wibble.Repo.Migrations.AddJobUserRelation do
  use Ecto.Migration

  def change do
    alter table(:jobs) do
      add :user_id, references(:users, on_delete: :nothing)
    end
  end
end
