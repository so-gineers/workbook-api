# frozen_string_literal: true

# Utilities to detect the current version of rails and make
# conditionals about it.
module NextRailsVersionHelper
  module_function

  def rails_7?
    Rails::VERSION::MAJOR >= 7
  end

  def rails_7!(&block)
    raise ArgumentError, 'You need to provide an' unless block_given?

    yield block if Rails::VERSION::MAJOR >= 7
  end
end
