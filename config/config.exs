# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :undi,
  ecto_repos: [Undi.Repo]

# Configures the endpoint
config :undi, UndiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9yLFqimCKGuA16MoDQeiu/6znxvmfmOzUNFzA/FGzSlHBeLE0/prOG4NtG9QVw8q",
  render_errors: [view: UndiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Undi.PubSub,
  live_view: [signing_salt: "okyW55xO"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :undi, Undi.Guardian,
  issuer: "undi",
  secret_key: "ebeQCTQ4Tz2NNdd7yoIW1l5zrNSIRUXUBRpFSQnLBldrp3Ch+gjZTft7oCdDzRrc3Ek=",
  ttl: {3, :days}

config :undi, UndiWeb.AuthAccessPipeline,
  module: Undi.Guardian,
  error_handler: UndiWeb.AuthErrorHandler

config :waffle,
  storage: Waffle.Storage.S3, # or Waffle.Storage.Local
  bucket: System.get_env("AWS_BUCKET_NAME") # if using S3

# If using S3:
config :ex_aws,
  json_codec: Jason,
  access_key_id: System.get_env("AWS_ACCESS_KEY_ID"),
  secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY"),
  region: System.get_env("AWS_REGION")

config :undi, Undi.Mailer,
  adapter: Bamboo.MandrillAdapter,
  api_key: "my_api_key"

config :kaffy,
   otp_app: :undi,
   ecto_repo: Undi.Repo,
   router: UndiWeb.Router

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
