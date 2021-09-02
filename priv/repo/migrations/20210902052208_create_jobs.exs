defmodule Wibble.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :company, :string
      add :position, :string
      add :status, :string

      timestamps()
    end

  end
end
