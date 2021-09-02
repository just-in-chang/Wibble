defmodule Wibble.Api.Job do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jobs" do
    field :company, :string
    field :position, :string
    field :status, :string
    field :link, :string

    belongs_to :user, Wibble.Api.User

    timestamps()
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:company, :position, :status, :link, :user_id])
    |> validate_required([:company, :position, :status, :user_id])
  end
end
