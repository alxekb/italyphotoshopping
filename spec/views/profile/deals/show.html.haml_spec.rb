require 'rails_helper'

RSpec.describe "profile/deals/show", type: :view do
  before(:each) do
    @profile_deal = assign(:profile_deal, Profile::Deal.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
