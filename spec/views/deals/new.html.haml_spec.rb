# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'deals/new', type: :view do
  before(:each) do
    assign(:deal, Deal.new(
                    profile: nil,
                    item: nil,
                    bye: '9.99',
                    sell: '9.99',
                    status: 'MyString',
                    messenger: 'MyString',
                    paid: false,
                    ransom: '',
                    comment: 'MyText',
                    payment_method: 'MyString'
                  ))
  end

  it 'renders new deal form' do
    render

    assert_select 'form[action=?][method=?]', deals_path, 'post' do
      assert_select 'input[name=?]', 'deal[profile_id]'

      assert_select 'input[name=?]', 'deal[item_id]'

      assert_select 'input[name=?]', 'deal[bye]'

      assert_select 'input[name=?]', 'deal[sell]'

      assert_select 'input[name=?]', 'deal[status]'

      assert_select 'input[name=?]', 'deal[messenger]'

      assert_select 'input[name=?]', 'deal[paid]'

      assert_select 'input[name=?]', 'deal[ransom]'

      assert_select 'textarea[name=?]', 'deal[comment]'

      assert_select 'input[name=?]', 'deal[payment_method]'
    end
  end
end
