@regression
Feature: 13d - A01 user

  Scenario: AO1 user performs MOT tests search by site id, then views tests
    Given I load "SITE" as {siteReference}, {siteName}
    And I login without 2FA using "AO1_USER" as {ao1User}
    When I click the "MOT tests" link
    And I select "Site (recent tests)" in the field with id "type"
    And I enter {siteReference} in the field with id "vts-search"
    And I click the "search" icon
    Then The page title contains "Vehicle Testing Station Search Results"
    And I check the table with heading "Test date/time" has at least 1 rows


  Scenario: AO1 user performs MOT tests search by vin, then views tests
    Given I load "VEHICLE_CLASS_4" as {registration}, {vin}, {mileage}
    And I login without 2FA using "AO1_USER" as {ao1User}
    When I click the "MOT tests" link
    And I select "VIN/Chassis (comparison available)" in the field with id "type"
    And I enter {vin} in the field with id "vts-search"
    And I click the "search" icon
    Then The page title contains "Mot Test Search Results"
    And I check the table with heading "Test date/time" has at least 1 rows


  Scenario: AO1 user creates a new AE
    Given I login without 2FA using "AO1_USER" as {ao1User}

    When I click the "Create an Authorised Examiner" link
    And I enter "Example MOT Testers" in the field with id "organisationName"
    And I enter "Example MOT Testers Ltd" in the field with id "tradingAs"
    And I select "Sole trader" in the "Business type" field
    And I enter "10 Example Street" in the field with id "REGCaddressLine1"
    And I enter "Example Town" in the field with id "REGCaddressTown"
    And I enter "AB1 2CD" in the field with id "REGCaddressPostCode"
    And I enter "01234567890" in the field with id "REGCphoneNumber"
    And I enter "success+no_one@simulator.amazonses.com" in the field with id "REGCemail"
    And I enter "success+no_one@simulator.amazonses.com" in the field with id "REGCemailConfirmation"
    And I click the "Yes" radio button in fieldset "Are they the same as the business contact details?"
    And I select "01" in the "DVSA Area Office" field
    And I press the "Continue" button
    And I press the "Create Authorised Examiner" button

    Then The page title contains "Authorised Examiner"
    And I check the "Name" field row has value "Example MOT Testers"
    And I check the "Trading name" field row has value "Example MOT Testers Ltd"
    And I check the "Business type" field row has value "Sole trader"
    And I check the "DVSA Area Office" field row has value "01"
    And I check the "Status" field row has value "Applied"


  Scenario: AO1 user creates a new VTS
    Given I login without 2FA using "AO1_USER" as {ao1User}

    When I click the "Create a site" link
    And I enter "Example Site" in the field with id "name"
    And I select "Vehicle Testing Station" in the "Site type" field
    And I enter "10 Example Street" in the field with id "BUSaddressLine1"
    And I enter "Example Town" in the field with id "BUSaddressTown"
    And I enter "AB1 2CD" in the field with id "BUSaddressPostCode"
    And I click the "England" radio button in fieldset "Country"
    And I enter "success+no_one@simulator.amazonses.com" in the field with id "BUSemail"
    And I enter "success+no_one@simulator.amazonses.com" in the field with id "BUSemailConfirmation"
    And I enter "01234567890" in the field with id "BUSphoneNumber"
    And I select "2" in the "How many two-person test lanes (TPTL) does the site have?" field
    And I select "3" in the "How many one-person test lanes (OPTL) does the site have?" field
    And I click the "Class 1" checkbox
    And I click the "Class 2" checkbox
    And I click the "Class 3" checkbox
    And I click the "Class 4" checkbox
    And I press the "Continue" button
    And I press the "Create site" button

    Then The page title contains "Vehicle testing station"
    And I check the "Name" field row has value "Example Site"
    And I check the "Classes" field row has value "1,2,3,4"
    And I check the "Type" field row has value "Vehicle Testing Station"
    And I check the "Status" field row has value "Approved"
    And I check the "Two Person Test Lane (TPTL)" field row has value "2"
    And I check the "One Person Test Lane (OPTL)" field row has value "3"
