require 'rails_helper'
require 'spec_helper'

describe User do

  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:user, name: nil)).to_not be_valid
  end

  it "is invalid without a provider" do
    expect(FactoryGirl.build(:user, provider: nil)).to_not be_valid
  end

  it "is invalid without a uid" do
    expect(FactoryGirl.build(:user, uid: nil)).to_not be_valid
  end

  it "is invalid without an email" do
    expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
  end

end
