defmodule CateringApp.Repo do
  use Ecto.Repo,
    otp_app: :catering_app,
    adapter: Ecto.Adapters.Postgres
end
