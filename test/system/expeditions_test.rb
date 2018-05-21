require "application_system_test_case"

class ExpeditionsTest < ApplicationSystemTestCase
  setup do
    @expedition = expeditions(:one)
  end

  test "visiting the index" do
    visit expeditions_url
    assert_selector "h1", text: "Expeditions"
  end

  test "creating a Expedition" do
    visit expeditions_url
    click_on "New Expedition"

    fill_in "Duration", with: @expedition.duration
    fill_in "Enemyagility", with: @expedition.enemyAgility
    fill_in "Enemyattack", with: @expedition.enemyAttack
    fill_in "Enemydefence", with: @expedition.enemyDefence
    fill_in "Enemyhp", with: @expedition.enemyHp
    fill_in "Enemystrength", with: @expedition.enemyStrength
    fill_in "Gainedexperience", with: @expedition.gainedExperience
    fill_in "Gainedgold", with: @expedition.gainedGold
    fill_in "Name", with: @expedition.name
    fill_in "Requiredlevel", with: @expedition.requiredLevel
    click_on "Create Expedition"

    assert_text "Expedition was successfully created"
    click_on "Back"
  end

  test "updating a Expedition" do
    visit expeditions_url
    click_on "Edit", match: :first

    fill_in "Duration", with: @expedition.duration
    fill_in "Enemyagility", with: @expedition.enemyAgility
    fill_in "Enemyattack", with: @expedition.enemyAttack
    fill_in "Enemydefence", with: @expedition.enemyDefence
    fill_in "Enemyhp", with: @expedition.enemyHp
    fill_in "Enemystrength", with: @expedition.enemyStrength
    fill_in "Gainedexperience", with: @expedition.gainedExperience
    fill_in "Gainedgold", with: @expedition.gainedGold
    fill_in "Name", with: @expedition.name
    fill_in "Requiredlevel", with: @expedition.requiredLevel
    click_on "Update Expedition"

    assert_text "Expedition was successfully updated"
    click_on "Back"
  end

  test "destroying a Expedition" do
    visit expeditions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Expedition was successfully destroyed"
  end
end
