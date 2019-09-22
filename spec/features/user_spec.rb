require 'rails_helper'
require 'capybara/rspec'

feature  'user registration' do
  scenario 'fills in a registration form' do
    visit('/')
    click_on('Войти')
    click_on('Зарегистрироваться')

    fill_in 'Email', with: '01@test.com'
    fill_in 'Пароль', with: '123123123'
    fill_in 'user_password_confirmation', with: '123123123'

    expect(page).to have_content('#user_password')
    expect(current_path).to have_content('/users/sign_up')
    # within('#user_password_confirmation') do
    # end
    # click_button 'Зарегистрироваться'
    # expect(page).to have_content 'Welcome!'
  end
end

feature 'user sign in' do
  let!(:user) { FactoryBot.create(:user_admin) }
  # before do
  #   create(:user_admin)
  # end

  scenario ' accepts registred user sign in' do
    visit users_sign_in_path
    fill_in 'Email', with: '01@test.com'
    fill_in 'Password', with: '123123123'
    click_button 'Войти'

    expect(page).to have_content 'Кабинет'
  end
end
