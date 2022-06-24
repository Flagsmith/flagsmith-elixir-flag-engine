import Config

config :notifier, Notifier.Scheduler,
  jobs: [
    {"@daily", {Notifier.Mailer, :send_notification, []}}
  ]

import_config "prod.secret.exs"
