require 'rails_helper'

RSpec.describe "profile/deals/index", type: :view do
  before(:each) do
    assign(:profile_deals, [
      Profile::Deal.create!(),
      Profile::Deal.create!()
    ])
  end

  it "renders a list of profile/deals" do
    render
  end
end
