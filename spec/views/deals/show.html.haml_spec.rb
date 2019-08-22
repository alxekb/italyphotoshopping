# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'deals/show', type: :view do
  before(:each) do
    @deal = assign(:deal, Deal.create!(
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
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Messenger/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Payment Method/)
  end
end
