class Pet < BaseModel
  table do
    column name : String
    column dob : Time
    column type : Int32
    belongs_to owner : Owner
  end
end
