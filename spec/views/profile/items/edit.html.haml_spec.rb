# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'profile/items/edit', type: :view do
  before(:each) do
    @profile_item = assign(:profile_item, Profile::Item.create!(
                                            item: 'MyString',
                                            brand: 'MyString',
                                            color: 'MyString',
                                            price: 1,
                                            cost: 1
                                          ))
  end

  it 'renders the edit profile_item form' do
    render

    assert_select 'form[action=?][method=?]', profile_item_path(@profile_item), 'post' do
      assert_select 'input[name=?]', 'profile_item[item]'

      assert_select 'input[name=?]', 'profile_item[brand]'

      assert_select 'input[name=?]', 'profile_item[color]'

      assert_select 'input[name=?]', 'profile_item[price]'

      assert_select 'input[name=?]', 'profile_item[cost]'
    end
  end
end
