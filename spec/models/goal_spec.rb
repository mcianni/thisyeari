require 'rails_helper'

describe Goal do

  it "has a valid factory" do
    expect(FactoryGirl.create(:goal)).to be_valid
  end

  it "sets a default current quantity" do
    expect(FactoryGirl.create(:goal).current_quantity).to be_zero
  end

  it "is invalid without a user" do
    expect(FactoryGirl.build(:goal, user: nil)).to_not be_valid
  end

  it "is invalid without a description" do
    expect(FactoryGirl.build(:goal, description: '')).to_not be_valid
  end

  it "is invalid without a numerical quantity" do
    expect(FactoryGirl.build(:goal, description: 'hi')).to_not be_valid
  end

  it "doesn't accept a negative quantity" do
    expect(FactoryGirl.create(:goal, description: "Read -5 books").quantity).to eql(5.0)
  end

  it "is invalid without a quantity > 0" do
    expect(FactoryGirl.build(:goal, description: "Read 0 books")).to_not be_valid
  end

end
