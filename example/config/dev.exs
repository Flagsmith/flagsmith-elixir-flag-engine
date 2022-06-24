import Config

config :notifier, Notifier.Mailer, adapter: Bamboo.LocalAdapter

config :notifier, Notifier.Scheduler,
  jobs: [
    {"* * * * *", {Notifier.Mailer, :send_notification, []}}
  ]

import_config "dev.secret.exs"
