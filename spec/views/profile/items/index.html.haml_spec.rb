require 'rails_helper'

RSpec.describe "profile/items/index", type: :view do
  before(:each) do
    assign(:profile_items, [
      Profile::Item.create!(
        :item => "Item",
        :brand => "Brand",
        :color => "Color",
        :price => 2,
        :cost => 3
      ),
      Profile::Item.create!(
        :item => "Item",
        :brand => "Brand",
        :color => "Color",
        :price => 2,
        :cost => 3
      )
    ])
  end

  it "renders a list of profile/items" do
    render
    assert_select "tr>td", :text => "Item".to_s, :count => 2
    assert_select "tr>td", :text => "Brand".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
