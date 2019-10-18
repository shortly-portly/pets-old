class Owners::Delete < BrowserAction
  delete "/owners/:owner_id/" do
    owner = OwnerQuery.find(owner_id)
    owner.delete

    redirect to: Owners::Index
  end
end
