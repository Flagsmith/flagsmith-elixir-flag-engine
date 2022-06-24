defmodule Notifier.MixProject do
  use Mix.Project

  def project do
    [
      app: :notifier,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Notifier.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:flagsmith_engine, "~> 0.1"},
      {:bamboo, "~> 2.2.0"},
      {:mime, "~> 2.0", override: true},
      {:quantum, "~> 3.0"}
    ]
  end
end
