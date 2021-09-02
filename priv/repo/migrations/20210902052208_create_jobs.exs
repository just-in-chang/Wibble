defmodule Wibble.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :company, :string
      add :position, :string
      add :status, :string

      timestamps()
    end

  end
end
