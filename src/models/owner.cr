class Owner < BaseModel
  table do
    column first_name : String
    column last_name : String
    column age : Int32

    has_many pets : Pet
  end
end
