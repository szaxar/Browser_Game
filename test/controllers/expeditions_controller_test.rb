require 'test_helper'

class ExpeditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expedition = expeditions(:one)
  end

  test "should get index" do
    get expeditions_url
    assert_response :success
  end

  test "should get new" do
    get new_expedition_url
    assert_response :success
  end

  test "should create expedition" do
    assert_difference('Expedition.count') do
      post expeditions_url, params: { expedition: { duration: @expedition.duration, enemyAgility: @expedition.enemyAgility, enemyAttack: @expedition.enemyAttack, enemyDefence: @expedition.enemyDefence, enemyHp: @expedition.enemyHp, enemyStrength: @expedition.enemyStrength, gainedExperience: @expedition.gainedExperience, gainedGold: @expedition.gainedGold, name: @expedition.name, requiredLevel: @expedition.requiredLevel } }
    end

    assert_redirected_to expedition_url(Expedition.last)
  end

  test "should show expedition" do
    get expedition_url(@expedition)
    assert_response :success
  end

  test "should get edit" do
    get edit_expedition_url(@expedition)
    assert_response :success
  end

  test "should update expedition" do
    patch expedition_url(@expedition), params: { expedition: { duration: @expedition.duration, enemyAgility: @expedition.enemyAgility, enemyAttack: @expedition.enemyAttack, enemyDefence: @expedition.enemyDefence, enemyHp: @expedition.enemyHp, enemyStrength: @expedition.enemyStrength, gainedExperience: @expedition.gainedExperience, gainedGold: @expedition.gainedGold, name: @expedition.name, requiredLevel: @expedition.requiredLevel } }
    assert_redirected_to expedition_url(@expedition)
  end

  test "should destroy expedition" do
    assert_difference('Expedition.count', -1) do
      delete expedition_url(@expedition)
    end

    assert_redirected_to expeditions_url
  end
end
