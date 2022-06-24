import Config

config :notifier, :configuration, environment_key: "<API KEY>"

import_config "#{Mix.env()}.exs"
