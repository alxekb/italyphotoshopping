# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'deals/edit', type: :view do
  before(:each) do
    @deal = assign(:deal, Deal.create!(
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

  it 'renders the edit deal form' do
    render

    assert_select 'form[action=?][method=?]', deal_path(@deal), 'post' do
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
