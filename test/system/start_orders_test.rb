require "application_system_test_case"

class StartOrdersTest < ApplicationSystemTestCase
  setup do
    @start_order = start_orders(:one)
  end

  test "visiting the index" do
    visit start_orders_url
    assert_selector "h1", text: "Start Orders"
  end

  test "creating a Start order" do
    visit start_orders_url
    click_on "New Start Order"

    click_on "Create Start order"

    assert_text "Start order was successfully created"
    click_on "Back"
  end

  test "updating a Start order" do
    visit start_orders_url
    click_on "Edit", match: :first

    click_on "Update Start order"

    assert_text "Start order was successfully updated"
    click_on "Back"
  end

  test "destroying a Start order" do
    visit start_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Start order was successfully destroyed"
  end
end
