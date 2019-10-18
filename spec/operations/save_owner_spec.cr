require "../spec_helper"

describe SaveOwner do
  it "should create an owner" do
    owner = SaveOwner.create!(first_name: "Dave", last_name: "Simmons", age: 22)
    owner.first_name.should eq "Dave"
  end

  it "should return an error if mandatory fields are not specified" do
    SaveOwner.create() do |operation, owner|
      owner.should eq nil
      operation.first_name.errors.should eq ["is required"]
      operation.last_name.errors.should eq ["is required"]
      operation.age.errors.should eq ["is required"]
    end
  end

  it "should error if the first name + last name already exist" do
    params = {"first_name" => "Dave", "last_name" => "Simmons", "age" => "22"}
    owner = SaveOwner.create!(params)

    SaveOwner.create(params) do |operation, owner|
      owner.should eq nil
      operation.first_name.errors.should eq ["This name has already been taken"]
    end
  end

  it "should error if age is less than 18" do
    params = {"first_name" => "Dave", "last_name" => "Simmons", "age" => "15"}
    SaveOwner.create(params) do |operation, owner|
      owner.should eq nil
      operation.age.errors.should eq ["An owner must be over 18 years of age"]
    end
  end

  it "should allow an update" do
    owner = SaveOwner.create!(first_name: "Dave", last_name: "Simmons", age: 22)

    params = {"age" => "55"}
    SaveOwner.update(owner, params) do |operation, owner|
      operation.saved?.should eq true
      owner.age.should eq 55
    end
  end

  it "should allow a deletion" do
    owner = SaveOwner.create!(first_name: "Dave", last_name: "Simmons", age: 22)
    owner.delete
    begin
      deleted_owner = OwnerQuery.find(owner.id)
      raise "Should never get here"
    rescue exception : Avram::RecordNotFoundError
    end
  end
end
