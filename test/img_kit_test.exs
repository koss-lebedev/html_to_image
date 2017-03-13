defmodule IMGKitTest do
  use ExUnit.Case
  doctest IMGKit

  test "simple method call" do
    assert IMGKit.convert("<html>TEST</html>") == "<html>TEST</html>"
  end

end
