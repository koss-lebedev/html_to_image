defmodule HtmlToImageTest do
  use ExUnit.Case
  doctest HtmlToImage

  test "simple method call" do
    template = "<html><p>Hello, <b>HtmlToImage</b>!</p></html>"
    { result, _ } = HtmlToImage.convert(template)
    assert result == :ok
  end

end
