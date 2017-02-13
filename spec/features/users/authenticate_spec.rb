require 'spec_helper'

describe "Logging In" do
  it "logs the user in and goes to the todo lists" do
    User.create(first_name: "John", last_name: "Carmichael", email: "jlcarmic@gmail.com", password: "password1234", password_confirmation: "password1234")
    visit new_user_session_path
    fill_in "Email Address", with: "jlcarmic@gmail.com"
    fill_in "Password", with: "password1234"
    click_button "Log In"
    expect(page).to have_content("Todo Lists")
    expect(page).to have_content("Thanks for logging in!")
  end

  it "displays the email address in the events of a failed login" do
    visit new_user_session_path
    fill_in "Email Address", with: "jlcarmic@gmail.com"
    fill_in "Password", with: "incorrect"
    click_button "Log In"

    expect(page).to have_content("Please check your email and password.")
    expect(page).to have_field("Email Address", with: "jlcarmic@gmail.com")
  end
end
