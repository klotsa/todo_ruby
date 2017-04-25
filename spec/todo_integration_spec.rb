require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('task',{:type => :feature}) do
  it('will add the task') do
    visit('/')
    fill_in('description', :with => 'scrub the zebra')
    click_button('Add task')
    expect(page).to have_content("The task has been successfully submitted!")
  end
  it('will show a list of tasks') do
    visit('/tasks')
    click_link('Back')
    expect(page).to have_content("scrub the zebra")
  end
end
