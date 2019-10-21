class Pets::Create < BrowserAction
  post "/owners/:owner_id/pets" do
    owner = OwnerQuery.find(owner_id)

    SavePet.create(params, owner_id: owner.id) do |operation, pet|
      if pet
        flash.success = "Pet created successfully"
        redirect to: Owners::Index
      else
        flash.failure = "Oops something went wrong"
        html NewPage, save_pet: operation, owner: owner
      end
    end
  end
end
