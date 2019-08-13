defmodule LiveAf.Repo do
  use Ecto.Repo,
    otp_app: :live_af,
    adapter: Ecto.Adapters.Postgres
end
