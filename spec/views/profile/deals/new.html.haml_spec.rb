# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'profile/deals/new', type: :view do
  before(:each) do
    assign(:profile_deal, Profile::Deal.new)
  end

  it 'renders new profile_deal form' do
    render

    assert_select 'form[action=?][method=?]', profile_deals_path, 'post' do
    end
  end
end
