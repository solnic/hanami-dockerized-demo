# frozen_string_literal: true

require "blog/repository"
require_relative "entities"

module Main
  class Repository < Blog::Repository
    struct_namespace Entities
  end
end
