defmodule UndiWeb.AuthAccessPipeline do
  use Guardian.Plug.Pipeline, otp_app: :undi

  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, allow_blank: true
end