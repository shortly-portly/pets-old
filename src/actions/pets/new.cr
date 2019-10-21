class Pets::New < BrowserAction
  get "/owners/:owner_id/pets/new/" do
    owner = OwnerQuery.find(owner_id)

    html NewPage, save_pet: SavePet.new, owner: owner
  end
end
