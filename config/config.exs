use Mix.Config

config :porcelain,
  driver: Porcelain.Driver.Basic

import_config "#{Mix.env}.exs"