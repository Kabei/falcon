defmodule Falcon.MixProject do
  use Mix.Project

  @version "0.0.0"

  def project do
    [
      app: :falcon,
      version: @version,
      elixir: "~> 1.3",
      start_permanent: Mix.env() == :prod,
      compilers: [:elixir_make] ++ Mix.compilers(),
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:elixir_make, "~> 0.4", runtime: false}
      # {:ex_doc, "~> 0.18.1", runtime: false},
      # {:excoveralls, ">= 0.0.0 ", only: :test}
    ]
  end

  # "Makefile1024"
  defp package do
    [
      name: "falcon",
      files: ["lib", "c_src", "mix.exs", "README*", "libfalcon", "Makefile"],
      maintainers: ["Kambei Sapote"],
      licenses: ["GNU GPLv3"]
    ]
  end
end
