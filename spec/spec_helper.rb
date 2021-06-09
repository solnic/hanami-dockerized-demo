# frozen_string_literal: true

require "pathname"

ENV["HANAMI_ENV"] = "test"

SPEC_ROOT = Pathname(__dir__).realpath.freeze
FIXTURES_PATH = SPEC_ROOT.join("fixtures").freeze

require_relative "support/rspec"
require_relative "support/suite"
Dir[File.join(__dir__, "support", "**", "global_config.rb")].each(&method(:require))

suite = Test::Suite.instance
suite.init_application
suite.start_coverage
