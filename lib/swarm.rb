module Swarm
  class Migration
    def migrate
      migrate_without_lock
    end

    private

    def migrate_without_lock
      puts 'Database migration'
      Rake::Task['db:migrate'].invoke
      puts 'Migrations successful'
    end
  end
end
