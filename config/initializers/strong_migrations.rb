# frozen_string_literal: true

if defined?(StrongMigrations)
  StrongMigrations.start_after = 20_210_815_002_042

  StrongMigrations.lock_timeout = 10.seconds

  StrongMigrations.statement_timeout = 1.hour

  StrongMigrations.auto_analyze = true

  StrongMigrations.safe_by_default = true
end
