# frozen_string_literal: true

# Base class for all active record models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  self.implicit_order_column = 'created_at'
end
