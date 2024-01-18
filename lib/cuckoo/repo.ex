defmodule Cuckoo.Repo do
  use Ecto.Repo,
    otp_app: :cuckoo,
    adapter: Ecto.Adapters.Postgres
end
