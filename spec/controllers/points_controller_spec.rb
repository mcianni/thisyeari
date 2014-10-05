require 'rails_helper'

describe PointsController do

  it "populates the goal" do
    goal = FactoryGirl.create(:goal)
    sign_in goal.user
    #get :show
    #expect(assigns(:goal)).to eql(goal)
  end

end
