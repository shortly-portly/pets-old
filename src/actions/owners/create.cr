class Owners::Create < BrowserAction
  post "/owners/" do
    SaveOwner.create(params) do |operation, owner|
      if owner
        flash.success = "Owner created successfully"
        redirect to: Owners::Index
      else
        flash.failure = "Oops something went wrong"
        html NewPage, save_owner: operation
      end
    end
  end
end
