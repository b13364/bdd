@uniqueUsageForm

Feature: potential coordinator bid answers consolidated for the corporate (Guillaume LEMARCHAND COO Orange business services)


  Background:
  I am logged in as "Guillaume.leMarchand"

  Scenario: confirmation message when clicking on "select as coordinator" button

    Given I am on the "answer/review table" page
    When  I click on "select as coordinator" button
    Then  I landed on the "confirm final coordinator" pop-up with the confirmation message "are you sure you want to take <<Lending entity name>> as a final coordinator?"


  Scenario: click on yes on the "confirm final coordinator" pop-up

    Given I am on the "confirm final coordinator" pop-up
    When  I click on "Yes" button
    Then  I landed on the "confirmation mail" page


  Scenario: click on No on the "confirm final coordinator" pop-up

    Given I am on the "confirm final coordinator" pop-up
    When  I click on "No" button
    Then  I landed on the "answer/review table" page


  Scenario: get bank answers in the "answer/review table" page

    Given I am on the "uniqueFormPage" page
    When lending entity bank click on send button
    And I am on the "answer/review table" page
    Then
