defmodule Wibble.Api.Job do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "jobs" do
    field :company, :string
    field :position, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:company, :position, :status])
    |> validate_required([:company, :position, :status])
  end
end
