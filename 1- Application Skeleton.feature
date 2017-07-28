@RFP
Feature: [SMARTF-X] Application Skeleton

  As a Corporate
  I want to have a link to the application
  So that I can access to the Invite Coordinating Banks page


  Scenario: Access to the Invite Coordinating Banks page

    Given I am a corporate
    And I am on the "Invite Coordinating Banks" page
    Then I see the header with the "Smart-F" logo
    And I see the title page "Invite Coordinating Banks"
    And the section named "Describe Facility Terms" is expanded
    And I see a "Next" button in "Describe Facility Terms" section
    And the section named "Select Recipients of the RFP" is collapsed
    And the section named "Prepare Draft Invitation E-mail" is collapsed

  Scenario: Navigate through sections using next buttons

    Given I am a corporate
    And I am on the "Invite Coordinating Banks" page
    When I click on the "Next" button in the "Describe Facility Terms" section
    Then the section named "Describe Facility Terms" is collapsed
    And the section named "Select Recipients of the RFP" is expanded
    And I see a "Next" button in "Select Recipients of the RFP" section
    And the section named "Prepare Draft Invitation E-mail" is collapsed

    When I click on the "Next" button in the "Select Recipients of the RFP" section
    Then the section named "Select Recipients of the RFP" is collapsed
    And the section named "Prepare Draft Invitation E-mail" is expanded
    And I see a "Send" button in "Prepare Draft Invitation E-mail" section
    And the section named "Describe Facility Terms" is collapsed

  Scenario: Expand a section by clicking on the header
    Given I am a corporate
    And I am on the "Invite Coordinating Banks" page
    When I click on the header of the section named "Describe Facility Terms"
    Then the section named "Describe Facility Terms" is collapsed
    When I click on the header of the section named "Describe Facility Terms"
    Then the section named "Describe Facility Terms" is expanded
    When I click on the header of the section named "Select Recipients of the RFP"
    Then the section named "Select Recipients of the RFP" is expanded
    When I click on the header of the section named "Select Recipients of the RFP"
    Then the section named "Select Recipients of the RFP" is collapsed
    When I click on the header of the section named "Prepare Draft Invitation E-mail"
    Then the section named "Prepare Draft Invitation E-mail" is expanded
    When I click on the header of the section named "Prepare Draft Invitation E-mail"
    Then the section named "Prepare Draft Invitation E-mail" is collapsed



  #do we have to add a test to check the ability to open all sections if needed? TEST
test
