class Owners::Index < BrowserAction
  get "/owners/" do
    owners = OwnerQuery.all.results

    html IndexPage, owners: owners
  end
end
