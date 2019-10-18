class Owners::New < BrowserAction
    get "/owners/new/" do
      html NewPage, save_owner: SaveOwner.new
    end
  end
  