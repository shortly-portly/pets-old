class CreatePets::V20191005162638 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(Pet) do
      primary_key id : Int64
      add name : String
      add_belongs_to owner : Owner, on_delete: :cascade
      add_timestamps
    end
  end

  def rollback
    drop table_for(Pet)
  end
end
