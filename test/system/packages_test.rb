# frozen_string_literal: true

require 'application_system_test_case'

class PackagesTest < ApplicationSystemTestCase
  setup do
    @package = packages(:one)
  end

  test 'visiting the index' do
    visit packages_url
    assert_selector 'h1', text: 'Packages'
  end

  test 'creating a Package' do
    visit packages_url
    click_on 'New Package'

    fill_in 'Item id', with: @package.item_id_id
    fill_in 'Pup code', with: @package.pup_code
    fill_in 'Shipping type', with: @package.shipping_type
    fill_in 'User', with: @package.user_id
    click_on 'Create Package'

    assert_text 'Package was successfully created'
    click_on 'Back'
  end

  test 'updating a Package' do
    visit packages_url
    click_on 'Edit', match: :first

    fill_in 'Item id', with: @package.item_id_id
    fill_in 'Pup code', with: @package.pup_code
    fill_in 'Shipping type', with: @package.shipping_type
    fill_in 'User', with: @package.user_id
    click_on 'Update Package'

    assert_text 'Package was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Package' do
    visit packages_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Package was successfully destroyed'
  end
end
