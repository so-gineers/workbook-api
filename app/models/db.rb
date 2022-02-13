# frozen_string_literal: true

# Base namespace for all active record models
# Namespacing AR models will probably allow us to separate db stuff from
# actual business logic
module Db
  def self.table_name_prefix
    'db_'
  end
end
