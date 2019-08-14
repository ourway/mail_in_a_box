defmodule MailInABox.MixProject do
  use Mix.Project

  def project do
    [
      app: :mail_in_a_box,
      version: "0.1.3",
      package: package(),
      description: "MainInABox administration client for elixir",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  defp package do
    # These are the default files included in the package
    [
      name: :main_in_a_box,
      files: ["lib", "mix.exs", "README*", "config", "test"],
      maintainers: ["Farsheed Ashouri"],
      licenses: ["MIT License"],
      links: %{key: "MainInABox website", value: "https://mailinabox.email/"},
      source_url: "https://github.com/ourway/mail_in_a_box",
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {MailInABox.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, ">= 0.0.0"},
      {:credo, "~> 1.0", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
