import Config

config :waf_test,
  port: String.to_integer(System.get_env("PORT", "8000"))
