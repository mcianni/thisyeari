require 'spec_helper'

describe 'point routing' do

  let(:path) { public_send(subject) }

  it { expect(get("/my-goal/points/new")).to      route_to("points#new") }
  it { expect(post("/my-goal/points")).to route_to("points#create") }

end
