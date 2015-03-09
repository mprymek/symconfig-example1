use Mix.Config

config :logger, :console,
  format: "\n[$level] $levelpad$message"

config :sym_config,
  pl_dir:        "deps/symconfig/priv",
  cache_dir:     "priv/cache",
  orig_dir:      "priv/orig",
  patches_dir:   "priv/patches",
  ssh_dir:       "priv/ssh",
  templates_dir: "priv/templates"

