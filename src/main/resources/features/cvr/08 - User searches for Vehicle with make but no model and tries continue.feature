@cvrpp @cvrint @cvrdemo
Feature: 08 - User searches for Vehicle with make but no model and tries continue

  Scenario: User searches for Vehicle but does not have the selected model and tries to continue but will see the There was a problem banner
    Given I browse to /
    And I click the "Vehicle safety recalls" radio button
    And I click the "Continue" button
    And I select "ALFA ROMEO" in the field with id "make"
    And I click the "Continue" button
    And I click the "Continue" button
    When // Check the 'There was a problem' banner text
    Then I click the "Select the vehicle model" link
