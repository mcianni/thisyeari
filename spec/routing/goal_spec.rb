require 'spec_helper'

describe 'goal routing' do

  let(:path) { public_send(subject) }

  it { expect(get("/my-goal")).to      route_to("goals#show") }
  it { expect(get("/my-goal/new")).to  route_to("goals#new") }
  it { expect(get("/my-goal/edit")).to route_to("goals#edit") }

end
