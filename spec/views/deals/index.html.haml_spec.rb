# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'deals/index', type: :view do
  before(:each) do
    assign(:deals, [
             Deal.create!(
               profile: nil,
               item: nil,
               bye: '9.99',
               sell: '9.99',
               status: 'Status',
               messenger: 'Messenger',
               paid: false,
               ransom: '',
               comment: 'MyText',
               payment_method: 'Payment Method'
             ),
             Deal.create!(
               profile: nil,
               item: nil,
               bye: '9.99',
               sell: '9.99',
               status: 'Status',
               messenger: 'Messenger',
               paid: false,
               ransom: '',
               comment: 'MyText',
               payment_method: 'Payment Method'
             )
           ])
  end

  it 'renders a list of deals' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: 'Status'.to_s, count: 2
    assert_select 'tr>td', text: 'Messenger'.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: ''.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'Payment Method'.to_s, count: 2
  end
end
