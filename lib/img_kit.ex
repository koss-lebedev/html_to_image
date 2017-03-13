defmodule IMGKit do
  @moduledoc """
    Provides a wrapper around `wkhtmltoimage` for creating images from HTML using WebKit engine
  """

  alias Porcelain.Result

  @doc """
    Converts given HTML string into binary image
  """
  def convert(html) do
    convert(html, [])
  end

  def convert(html, options) do
    executable = Keyword.get(options, :wkhtmltoimage_path) || executable_path
    base_filename = Path.join(System.tmp_dir, random_filename)
    output_file = base_filename <> ".jpg"

    shell_params = [format: :jpg]
    arguments = List.flatten([ shell_params, "-q", "-", "-" ])

    %Result{ out: bin_data, status: status, err: error } = Porcelain.exec(
      executable, arguments, [in: html, out: :string, err: :string]
    )

    html
  end

  defp executable_path do
    {path, result} = System.cmd("which", ["wkhtmltoimage"])
    case result do
      0 -> path |> String.trim
      _ -> Application.get_env(:img_kit, :wkhtmltoimage_path) || "/usr/local/bin/wkhtmltoimage"
    end
  end

  defp random_filename(length \\ 16) do
    :crypto.strong_rand_bytes(length) |> Base.url_encode64 |> binary_part(0, length)
  end

end
