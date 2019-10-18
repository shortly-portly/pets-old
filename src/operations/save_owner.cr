class SaveOwner < Owner::SaveOperation
  permit_columns first_name, last_name, age, id

  before_save do
    validate_required first_name
    validate_required last_name
    validate_required age
    validate_uniqueness_of_fullname
    validate_age
  end

  def validate_uniqueness_of_fullname
    owner = OwnerQuery.new.fullname(first_name, last_name, id)

    if owner
      first_name.add_error "This name has already been taken"
    end
  end

  def validate_age
    age.value.try do |value|
      if value < 18
        age.add_error "An owner must be over 18 years of age"
      end
    end
  end
end
