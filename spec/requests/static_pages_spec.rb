require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before { visit help_path }

    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title(full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1', text: 'Contact') }
    it { should have_title(full_title('Contact')) }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))      # fill in
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))   # fill in
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign up'))   # fill in
    click_link "sample app"
    expect(page).to have_title(full_title(''))          # fill in
  end
end

# --------------------------------- old one ---------------------------------------
# require 'spec_helper'

# describe "Static pages" do

#   describe "Home page" do

#     it "should have the content 'Sample App'" do
#       visit '/static_pages/home'
#       expect(page).to have_content('Sample App')
#     end
#   end

#   describe "Help page" do

#     it "should have the content 'Help'" do
#       visit '/static_pages/help'
#       expect(page).to have_content('Help')
#     end
#   end

#   describe "About Page" do
	
# 	it "should have the content 'About Us'" do
# 		visit '/static_pages/about'
# 		expect(page).to have_content('About Us')
# 	end
#   end
# end
#---------------------------------------old one ends --------------------------------

#-------------------------------original one with this version of rails--------------
# require 'spec_helper'

# describe "StaticPages" do
#   describe "GET /static_pages" do
#     it "works! (now write some real specs)" do
#       # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#       get static_pages_index_path
#       response.status.should be(200)
#     end
#   end
# end
