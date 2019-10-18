class Pet < BaseModel
  table do
    column name : String
    belongs_to owner : Owner
  end
end
