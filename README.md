# HtmlToImage

[![Hex.pm version](https://img.shields.io/hexpm/v/html_to_image.svg)](https://hex.pm/packages/html_to_image)
[![Hex.pm downloads](https://img.shields.io/hexpm/dt/html_to_image.svg)](https://hex.pm/packages/html_to_image)

Elixir wrapper around `wkhtmltoimage` tool for converting HTML into images

## Installation

  1. Add `html_to_image` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:html_to_image, "~> 0.1.4"}]
end
```

  2. Ensure `html_to_image` is started before your application:

```elixir
def application do
  [applications: [:html_to_image]]
end
```

## Usage

```elixir
template = "<html><p>Hello, <b>HtmlToImage</b>!</p></html>"
{ :ok, data } = HtmlToImage.convert(template)
```

```elixir
template = "<html><p>We are purging the html template on disk vs waiting for the os gc to clean the tmp dir, in this example</p></html>"
options = [{:purge_template, true}] 
{ :ok, data } = HtmlToImage.convert(template, options)
```

Complete API reference is available at [hexdocs](https://hexdocs.pm/html_to_image/api-reference.html)
