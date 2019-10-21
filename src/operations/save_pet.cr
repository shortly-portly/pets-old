class SavePet < Pet::SaveOperation
    permit_columns name, dob, type, owner_id

end
