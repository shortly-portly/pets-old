class CreateOwners::V20191009213734 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Owner) do
      primary_key id : Int64
      add first_name : String
      add last_name : String
      add age : Int32
      
      add_timestamps
    end

  create_index :owners, [:first_name, :last_name], unique: true

  end

  def rollback
    drop table_for(Owner)
  end
end
