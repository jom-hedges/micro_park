defmodule MicroPark.Repo do
  use Ecto.Repo,
    otp_app: :micro_park,
    adapter: Ecto.Adapters.Postgres
end
