class Owners::Update < BrowserAction
  put "/owners/:owner_id" do
    owner = OwnerQuery.find(owner_id)

    SaveOwner.update(owner, params) do |operation, owner|
      if operation.saved?
        flash.success = "Owner updated successfully"
        redirect to: Owners::Index
      else
        flash.failure = "Oops something went wrong"
        html EditPage, save_owner: operation, owner: owner
      end
    end
  end
end
