defmodule IMGKitTest do
  use ExUnit.Case
  doctest IMGKit

  test "simple method call" do
    template = "<html><p>Hello, <b>IMGKit</b>!</p></html>\n\n"
    { result, _ } = IMGKit.convert(template)
    assert result == :ok
  end

end
