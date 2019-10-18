class Owners::Edit < BrowserAction
  get "/owners/:owner_id/edit/" do
    owner = OwnerQuery.find(owner_id)
    html EditPage, save_owner: SaveOwner.new(owner), owner: owner
  end
end
