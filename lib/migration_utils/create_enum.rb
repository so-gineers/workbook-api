module MigrationUtils
  module CreateEnum
    def create_enum(name, values)
      reversible do |dir|
        dir.up do
          say_with_time "create_enum(:#{name})" do
            suppress_messages do
              execute "CREATE TYPE #{name} AS ENUM (#{values.map { |v| quote(v) }.join(', ')})"
            end
          end
        end

        dir.down do
          say_with_time "drop_enum(:#{name})" do
            execute "DROP TYPE #{name}"
          end
        end
      end
    end
  end
end
