defmodule HtmlToImageTest do
  use ExUnit.Case
  doctest HtmlToImage

  test "simple method call" do
    template = File.read!("template.html")
    { result, content } = HtmlToImage.convert(template, width: 500)

#    {:ok, file} = File.open "image.jpg", [:write]
#    IO.binwrite file, content
#    File.close file

    assert result == :ok
  end

end
