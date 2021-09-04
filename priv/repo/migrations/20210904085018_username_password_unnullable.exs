defmodule Wibble.Repo.Migrations.UsernamePasswordUnnullable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      modify :username, :string, null: false
      modify :password_hash, :string, null: false
    end
  end
end
