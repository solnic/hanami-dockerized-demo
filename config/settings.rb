# frozen_string_literal: true

require "blog/types"

Hanami.application.settings do
  # Framework
  setting :log_to_stdout, Blog::Types::Params::Bool.optional.default(false)

  # Database
  setting :database_url, Blog::Types::String

  # Application
  setting :session_secret, Blog::Types::String

  # Assets
  setting :precompiled_assets, Blog::Types::Params::Bool.optional.default(false)
  setting :assets_server_url, Blog::Types::String.optional.default("http://localhost:8080")
end
