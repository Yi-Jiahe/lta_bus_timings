defmodule LtaBusTimings.Repo do
  use Ecto.Repo,
    otp_app: :lta_bus_timings,
    adapter: Ecto.Adapters.Postgres
end
