require "application_system_test_case"

class ChallengesTest < ApplicationSystemTestCase
  setup do
    @challenge = challenges(:one)
  end

  test "visiting the index" do
    visit challenges_url
    assert_selector "h1", text: "Challenges"
  end

  test "creating a Challenge" do
    visit challenges_url
    click_on "New Challenge"

    fill_in "Attacker", with: @challenge.attacker
    fill_in "Date", with: @challenge.date
    fill_in "Defender", with: @challenge.defender
    fill_in "Gold", with: @challenge.gold
    fill_in "Winner", with: @challenge.winner
    click_on "Create Challenge"

    assert_text "Challenge was successfully created"
    click_on "Back"
  end

  test "updating a Challenge" do
    visit challenges_url
    click_on "Edit", match: :first

    fill_in "Attacker", with: @challenge.attacker
    fill_in "Date", with: @challenge.date
    fill_in "Defender", with: @challenge.defender
    fill_in "Gold", with: @challenge.gold
    fill_in "Winner", with: @challenge.winner
    click_on "Update Challenge"

    assert_text "Challenge was successfully updated"
    click_on "Back"
  end

  test "destroying a Challenge" do
    visit challenges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Challenge was successfully destroyed"
  end
end
