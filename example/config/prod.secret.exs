import Config

config :flagsmith_engine, :configuration, environment_key: "ser.ETKNCjTGwbNW3Ze6Ekpgyv"

config :notifier, Notifier.Mailer,
  adapter: Bamboo.MailgunAdapter,
  domain: "sandboxf4ab7d84d8c840fea1c562f13e768d2a.mailgun.org",
  api_key: "8de57ec0e7d9a63a05f318f26fbae772-4f207195-9c321c2e"
