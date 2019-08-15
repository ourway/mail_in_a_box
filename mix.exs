defmodule MailInABox.MixProject do
  use Mix.Project

  def project do
    [
      app: :mail_in_a_box,
      version: "0.1.7",
      package: package(),
      description: "MainInABox administration client for elixir",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      source_url: "https://github.com/ourway/mail_in_a_box",
      deps: deps()
    ]
  end

  defp package do
    # These are the default files included in the package
    [
      name: :mail_in_a_box,
      files: ["lib", "mix.exs", "README*", "config", "test", "priv/*.eex"],
      maintainers: ["Farsheed Ashouri"],
      licenses: ["MIT License"],
      links: %{"GitHub" => "https://github.com/ourway/mail_in_a_box"}
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
      # For sending emails:
      {:swoosh, "~> 0.23"},
      {:gen_smtp, "~> 0.13"},
      # For Imap commands
      {:eximap, "~> 0.1.1-dev"},
      # test and development,
      {:credo, "~> 1.0", only: [:dev, :test], runtime: false},
      # docs
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
