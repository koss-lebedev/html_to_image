defmodule HtmlToImage.Mixfile do
  use Mix.Project

  def project do
    [app: :html_to_image,
     version: "0.1.2",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     name: "HtmlToImage",
     source_url: "https://github.com/koss-lebedev/html_to_image",
     description: description(),
     package: package()
     ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:logger, :porcelain]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:porcelain, "~> 2.0"}
    ]
  end

  defp description do
    """
    Elixir wrapper around `wkhtmltoimage` tool for converting HTML into images
    """
  end

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["Constantine Lebedev"],
      links: %{
        "GitHub": "https://github.com/koss-lebedev/html_to_image"
      }
    ]
  end

end
