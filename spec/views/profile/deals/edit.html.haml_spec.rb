require 'rails_helper'

RSpec.describe "profile/deals/edit", type: :view do
  before(:each) do
    @profile_deal = assign(:profile_deal, Profile::Deal.create!())
  end

  it "renders the edit profile_deal form" do
    render

    assert_select "form[action=?][method=?]", profile_deal_path(@profile_deal), "post" do
    end
  end
end
