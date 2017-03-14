# HtmlToImage

Elixir wrapper around `wkhtmltoimage` tool for converting HTML into images

## Installation

  1. Add `html_to_image` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:html_to_image, "~> 0.1.0"}]
end
```

  2. Ensure `html_to_image` is started before your application:

```elixir
def application do
  [applications: [:html_to_image]]
end
```

