require 'rails_helper'

RSpec.describe "profile/items/new", type: :view do
  before(:each) do
    assign(:profile_item, Profile::Item.new(
      :item => "MyString",
      :brand => "MyString",
      :color => "MyString",
      :price => 1,
      :cost => 1
    ))
  end

  it "renders new profile_item form" do
    render

    assert_select "form[action=?][method=?]", profile_items_path, "post" do

      assert_select "input[name=?]", "profile_item[item]"

      assert_select "input[name=?]", "profile_item[brand]"

      assert_select "input[name=?]", "profile_item[color]"

      assert_select "input[name=?]", "profile_item[price]"

      assert_select "input[name=?]", "profile_item[cost]"
    end
  end
end
