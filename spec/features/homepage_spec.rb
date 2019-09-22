require 'rails_helper'
require 'capybara/rspec'

feature 'my home page' do
	scenario 'home page welcome' do
		visit('/')
		expect(page).to have_content("Italy photo shopping")
		expect(page).to have_content("Войти")
		expect(page).to have_content("Товары")
		expect(page).to have_content("Информация")
	end
end
