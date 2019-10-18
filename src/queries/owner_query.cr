class OwnerQuery < Owner::BaseQuery
    
  def fullname(first, last, owner_id)
    first_name.nilable_eq(first.value)
      .last_name.nilable_eq(last.value)
      .id.not.nilable_eq(owner_id.value)
      .first?
  end
end
