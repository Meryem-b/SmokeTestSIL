@mothhgv @mothint
Feature: 12 - HGV History vehicle check with expired/expiring Annual Test

  Scenario: A MOTH user searches for a HGV with an expired Annual Test
    Given I browse to /
    And I enter "HISTEXP" in the registration field
    When I press the "Continue" button

    Then The page contains "This vehicle's annual test has expired"
    And The page contains "If the vehicle has been tested recently, it can take up to 10 working days for us to update our records"
    And The page contains "This vehicle may be MOT exempt, for more information refer to MOT exemption guidance"

    And I click the "MOT exemption guidance" link
    And I go to the next tab
    And I go to the next tab
    And I close extra tabs

    And The page contains "HISTEXP"
    And The page contains "DAF FA LF45.130 08"
    And The page title contains "Check annual test history"
    And The page contains "Check another vehicle"
    And The page contains "Colour"
    And The page contains "Fuel type"
    And The page contains "Date registered"
    And The page contains "Annual test expired on"
    And The page contains "31 October 2002"
    And The page does not contain "reminders"
    And The page contains "The mileage recorded at test is currently not available for heavy goods and public service vehicles."
    And The page contains "It can take up to 10 working days for the latest annual test results to appear."
    And The page contains "If you think the annual test expiry date or any of the vehicle details are wrong, contact DVSA."

    And I click the "contact" link
    And I go to the next tab
    Then The page title contains "Contact DVSA - GOV.UK"
    And I go to the next tab
    And I close extra tabs

    And The page contains "Annual test results"
    And The page contains "Check test expiry date, defects and advisories"
    And The page does not contain "Outstanding vehicle recalls"
    And I click the accordion section with the id "mot-history-description"

    And The page contains "Date tested"
    And The page contains "4 December 2013"
    And The page contains "Test Certificate number"
    And The page contains "GG80715"
    And The page contains "Test location"
    And The page contains "unavailable until further notice"
    And The page contains "Fail"
    And The page does not contain "MOT test number"
    And The page does not contain "Mileage"

    And The page contains "What are failures and advisories?"
    And I click the "What are failures and advisories?" help link
    And The page contains "Failure items must be fixed before the vehicle can pass its annual test."
    And The page contains "Advisory items are provided for advice. For some of these, if they became more serious, your vehicle may no longer be roadworthy and could require immediate attention."

  Scenario: A MOTH user searches for a HGV with a current Annual Test that expires tomorrow
    Given I browse to /
    And I enter "EXTOMOR" in the registration field
    When I press the "Continue" button

    Then The page contains "EXTOMOR"
    And The page contains "CONVERSION"
    And The page contains "This vehicle's annual test expires soon"

  Scenario: A MOTH user searches for a HGV with a Annual Test that is just about to expire
    Given I browse to /
    And I enter "EXYESTE" in the registration field
    When I press the "Continue" button

    Then The page contains "EXYESTE"
    And The page contains "CONVERSION"
    And The page contains "This vehicle's annual test has expired"
    And The page contains "If the vehicle has been tested recently, it can take up to 10 working days for us to update our records"
    And The page contains "This vehicle may be MOT exempt, for more information refer to MOT exemption guidance"

    And I click the "MOT exemption guidance" link
    And I go to the next tab
    And I go to the next tab
    And I close extra tabs

  Scenario: A MOTH user searches for a HGV with a Annual Test that expires today
    Given I browse to /
    And I enter "EXTODAY" in the registration field
    When I press the "Continue" button

    Then The page contains "EXTODAY"
    And The page contains "CONVERSION"
    And The page contains "This vehicle's annual test expires soon"

  Scenario: A MOTH user searches for a HGV with a Annual Test that is due soon
    Given I browse to /
    And I enter "NOHOLD1" in the registration field
    When I press the "Continue" button

    Then The page contains "NOHOLD1"
    And The page contains "IVECO FORD CARGO ML75E17"
    And The page contains "This vehicle hasn't had its first annual test"
    And The page contains "If the vehicle has been tested recently, it can take up to 10 working days for us to update our records"
    And I click the accordion section with the id "mot-history-description"

    And The page contains "This vehicle hasn't had its first annual test."