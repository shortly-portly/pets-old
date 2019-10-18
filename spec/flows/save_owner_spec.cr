require "../spec_helper"

describe "Owner Flow" do
  it "creates a new owner" do
    flow = BaseFlow.new

    flow.visit "/owners"
    flow.click "@new-owner-button"
    flow.fill_form SaveOwner,
      first_name: "Dave",
      last_name: "Simmons",
      age: "22"

    flow.click "@create-owner"
    flow.el("@first_name", text: "Dave").should be_on_page
  end

  it "return an error if first_name not present" do
    flow = BaseFlow.new

    flow.visit "/owners"
    flow.click "@new-owner-button"
    flow.fill_form SaveOwner,
      last_name: "Simmons",
      age: "22"

    flow.click "@create-owner"
    flow.el("@first_name_error", text: "First name is required").should be_on_page
  end

  it "allows the update of owner details" do
    flow = BaseFlow.new

    flow.visit "/owners"
    flow.click "@new-owner-button"
    flow.fill_form SaveOwner,
      first_name: "Dave",
      last_name: "Simmons",
      age: "22"
    flow.click "@create-owner"

    flow.click "@edit-owner"
    flow.fill_form SaveOwner,
      age: "55"

    flow.click "@update-owner"

    flow.el("@age", text: "55").should be_on_page
  end

  it "allows the deletion of owner details" do
    flow = BaseFlow.new

    flow.visit "/owners"
    flow.click "@new-owner-button"
    flow.fill_form SaveOwner,
      first_name: "Dave",
      last_name: "Simmons",
      age: "22"
    flow.click "@create-owner" 
    
    flow.click "@delete-owner"

    flow.el("@first_name", text: "Dave").should_not be_on_page
  end
end
