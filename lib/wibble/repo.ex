defmodule Wibble.Repo do
  use Ecto.Repo,
    otp_app: :wibble,
    adapter: Ecto.Adapters.Postgres
end
