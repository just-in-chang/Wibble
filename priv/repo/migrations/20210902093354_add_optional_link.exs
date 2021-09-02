defmodule Wibble.Repo.Migrations.AddOptionalLink do
  use Ecto.Migration

  def change do
    alter table(:jobs) do
      add :link, :string
    end
  end
end
