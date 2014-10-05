require 'rails_helper'

describe GoalsController do

  it "populates the goal" do
    goal = FactoryGirl.create(:goal)
    sign_in goal.user
    get :show
    expect(assigns(:goal)).to eql(goal)
  end

  it "renders the :edit view for the user" do
    goal = FactoryGirl.create(:goal)
    sign_in goal.user
    get :edit
    expect(assigns(:goal)).to eql(goal)
    expect(response).to render_template :edit
  end

  it "doesn't render the :edit view for another user" do
    FactoryGirl.create(:goal)
    expect(assigns(:goal)).to eql(nil)
    expect(response).to_not render_template :edit
  end

end
