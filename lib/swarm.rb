module Swarm
  class Migration
    def migrate
      migrate_without_lock
    end

    private

    def migrate_without_lock
      Rake::Task['environment'].invoke
      database_exist = begin
        ActiveRecord::Base.connection.present?
      rescue ActiveRecord::NoDatabaseError
        false
      end

      if database_exist
        puts 'Database exists, process finished successfully'
      else
        puts 'Database does not exist, process started...'
        Rake::Task['db:setup'].invoke
        puts 'Database created.'
      end
      puts 'Database migration'
      Rake::Task['db:migrate'].invoke
      puts 'Migrations successful'
    end
  end
end
