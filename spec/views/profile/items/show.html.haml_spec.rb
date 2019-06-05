require 'rails_helper'

RSpec.describe "profile/items/show", type: :view do
  before(:each) do
    @profile_item = assign(:profile_item, Profile::Item.create!(
      :item => "Item",
      :brand => "Brand",
      :color => "Color",
      :price => 2,
      :cost => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Item/)
    expect(rendered).to match(/Brand/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
