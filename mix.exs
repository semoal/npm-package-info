defmodule NpmPackageInfo.MixProject do
  use Mix.Project

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE*"],
      maintainers: ["Sergio Moreno"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/semoal/npm-package-info"}
    ]
  end

  def project do
    [
      app: :npm_package_info,
      version: "0.1.0",
      elixir: "~> 1.0",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env() == :prod,
      package: package,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.18", only: :dev},
      {:credo, "~> 1.1.0", only: [:dev, :test], runtime: false},
      {:jason, "~> 1.1"},
      {:tesla, "~> 1.2.1"}
    ]
  end
end
