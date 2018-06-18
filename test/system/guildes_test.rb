require "application_system_test_case"

class GuildesTest < ApplicationSystemTestCase
  setup do
    @guilde = guildes(:one)
  end

  test "visiting the index" do
    visit guildes_url
    assert_selector "h1", text: "Guildes"
  end

  test "creating a Guilde" do
    visit guildes_url
    click_on "New Guilde"

    fill_in "Max Members", with: @guilde.max_members
    fill_in "Name", with: @guilde.name
    click_on "Create Guilde"

    assert_text "Guilde was successfully created"
    click_on "Back"
  end

  test "updating a Guilde" do
    visit guildes_url
    click_on "Edit", match: :first

    fill_in "Max Members", with: @guilde.max_members
    fill_in "Name", with: @guilde.name
    click_on "Update Guilde"

    assert_text "Guilde was successfully updated"
    click_on "Back"
  end

  test "destroying a Guilde" do
    visit guildes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Guilde was successfully destroyed"
  end
end
