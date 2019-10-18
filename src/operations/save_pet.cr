class SavePet < Pet::SaveOperation
    permit_columns name, owner_id

    after_save after_save_for_pet
  after_commit after_commit_for_pet

  def after_save_for_pet(pet : Pet)
    puts "after_save_for_pet called"
    # AppDatabase.rollback

  end

  def after_commit_for_pet(pet : Pet)
    puts "after_commit_for_pet called"
  end
end
