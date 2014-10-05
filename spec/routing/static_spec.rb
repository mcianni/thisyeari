require 'spec_helper'

describe 'static page routing' do

  let(:path) { public_send(subject) }

  it { expect(get("/")).to route_to("pages#home") }
  it { expect(get("/privacy-policy")).to route_to("pages#privacy_policy") }
  it { expect(get("/about")).to          route_to("pages#about") }
  it { expect(get("/demo")).to           route_to("pages#demo") }

end
