defmodule HtmlToImage do
  @moduledoc """
  Provides a wrapper around `wkhtmltoimage` for creating images from HTML using WebKit engine
  """

  @reserved_keywords [:wkhtmltoimage_path, :purge_template ]
  @default_arguments  ["--format", :jpg, "--width",  "1024", "--quality", "94"]
  @default_path "/usr/local/bin/wkhtmltoimage"

  @doc """
  Converts given HTML string into binary image
  """
  def convert(html) do
    convert(html, [])
  end

  @doc """
  Converts given HTML string into binary image.

  Returns binary data <iodata> of the generated image

  ## Options

      wkhtmltoimage_path - specify a path where wkhtmltoimage tool is installed
      format - the format of output image file. Default is JPG
  """
  def convert(html, options) do
    executable = Keyword.get(options, :wkhtmltoimage_path) || executable_path()
    template_name = template_file(html)

    keys = Keyword.keys(options)
    search_keys = Enum.reject(keys, fn(x) -> Enum.member?(@reserved_keywords, x) end)

    found_arguments = Enum.map(search_keys, fn(x) ->
    value = Keyword.get(options, x)
    ["--" <> to_string(x), value]
    end)

    flattened_arguments = List.flatten(found_arguments)

    merged_arguments = Keyword.merge(@default_arguments, flattened_arguments)

    arguments = merged_arguments ++ [template_name, "-" ]

    result = Porcelain.exec(
      executable, arguments, [in: html, out: :iodata, err: :string]
    )

    case result.status do
      0 ->
        purge_template? = Keyword.get(options, :purge_template) || false

        if purge_template? == true, do: File.rm(template_name)

        { :ok, result.out }
      _ -> if result.err == "", do: { :ok, result.out }, else: { :error, result.err }
    end
  end

  defp template_file(data) do
    template = Path.join(System.tmp_dir, random_filename()) <> ".html"
    {:ok, file} = File.open template, [:write]
    IO.binwrite file, data
    File.close file
    template
  end

  defp executable_path do
    {path, result} = System.cmd("which", ["wkhtmltoimage"])
    case result do
      0 -> path |> String.trim
      _ -> Application.get_env(:html_to_image, :wkhtmltoimage_path) || @default_path
    end
  end

  defp random_filename(length \\ 16) do
    :crypto.strong_rand_bytes(length) |> Base.url_encode64 |> binary_part(0, length)
  end

end
