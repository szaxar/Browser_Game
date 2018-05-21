require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Agility", with: @user.agility
    fill_in "Attack", with: @user.attack
    fill_in "Auth Expires At", with: @user.auth_expires_at
    fill_in "Defence", with: @user.defence
    fill_in "Email", with: @user.email
    fill_in "Experience", with: @user.experience
    fill_in "Gold", with: @user.gold
    fill_in "Hp", with: @user.hp
    fill_in "Lvl", with: @user.lvl
    fill_in "Name", with: @user.name
    fill_in "Nick", with: @user.nick
    fill_in "Oauth Token", with: @user.oauth_token
    fill_in "Provider", with: @user.provider
    fill_in "Strength", with: @user.strength
    fill_in "Uid", with: @user.uid
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Agility", with: @user.agility
    fill_in "Attack", with: @user.attack
    fill_in "Auth Expires At", with: @user.auth_expires_at
    fill_in "Defence", with: @user.defence
    fill_in "Email", with: @user.email
    fill_in "Experience", with: @user.experience
    fill_in "Gold", with: @user.gold
    fill_in "Hp", with: @user.hp
    fill_in "Lvl", with: @user.lvl
    fill_in "Name", with: @user.name
    fill_in "Nick", with: @user.nick
    fill_in "Oauth Token", with: @user.oauth_token
    fill_in "Provider", with: @user.provider
    fill_in "Strength", with: @user.strength
    fill_in "Uid", with: @user.uid
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
