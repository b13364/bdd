@RFP
Feature: [SMARTF-X]

  As a Corporate
  I want to start filling covenants data
  So that I can include them in the termsheet


  # Renewal facility type scenario
  Scenario Outline: covenants initialization and data persistence with all missing fields

    Given I am a corporate
    And I am on the "Select main covenant" page

    When I check "Interest cover ratio" checkbox
    And i type "<interestValue>" in the "Interest cover ratio" text field
    And I check "Net debt to EBITDA" checkbox
    And i type "<NetDebtValue>" in the "Net debt to EBITDA" text field
    And I check "Net service ratio" checkbox
    And i type "<NetServiceValue>" in the "Net service ratio" text field
    And I check "Max capex" checkbox
    And i type "<CapexValue>" in the "Max capex" text field

    And I choose "<Currency>" in the "Currency" dropdown
    And I type "<Amount>" in the "Amount" text field
    And I choose "<Reference rate>" in the "Reference rate" radio
    And I type "<Target margin>" in the "Target margin" text field
    And I choose "<Amortizing method>" in the "Amortizing method" radio

    And I click on the date picker's left arrow until the selected month is "<Target starting date>"
    And I click on the date picker's day "<Target starting date>"

    And I type "<YearTerm>" in the "Year Term" text field
    And I type "<MonthTerm>" in the "Month Term" text field

    And I choose "<Extension option>" in the "Extension option" radio

    And I choose "<Governing law>" in the "Governing law" dropdown
    And I choose "Standard LMA" in the "Documentation template" radio

    And I refresh the page

    Then "Renewal" is chosen in the "Facility type" radio
    And I see "<Existing facility start date>" in the "Start date of the existing facility" date picker
    And "<Currency>" is chosen in the "Currency" dropdown
    And I see "<Amount>" in the "Amount" text field
    And "<Reference rate>" is chosen in the "Reference rate" radio
    And I see "<target margin>" in the "Target margin" text field
    And "<Amortizing method>" is chosen in the "Amortizing method" radio
    And I see "<Target starting date>" in the "Target starting date" date picker
    And I see "<YearTerm>" in the "Year Term" text field
    And I see "<MonthTerm>" in the "Month Term" text field
    And "<Extension option>" is chosen in the "Extension option" radio
    And "<Governing law>" is chosen in the "Governing law" dropdown
    And "Standard LMA" is chosen in the "Documentation template" radio

    Examples:
      | Existing facility start month | Existing facility start day | Existing facility start date | Currency | Amount   | Reference rate | Target margin | Amortizing method | Target starting date | YearTerm | MonthTerm | Extension option | Governing law |
      | Jul 2016                      | 1                           | 07/01/2016                   | EUR      | 10000000 | Euribor        | 25            | Bullet            | 03/07/2017           | 5        | 6         | 1 year           | France        |
      |                               |                             |                              | USD      | 20000000 | LIBOR          | 10            | Bullet            | 03/08/2017           | 1O       |           | 1 year + 1 year  | UK            |
      |                               |                             |                              | EUR      |          |                |               |                   |                      |          |           |                  |               |

  # Scenario de type "new"
  Scenario Outline: New Facility terms initialization and data persistence with all missing fields

    Given I am a corporate
    And I am on the "Invite Coordinating Banks" page

    When I choose "New" in the "Facility type" radio
    And I choose "<Currency>" in the "Currency" dropdown
    And I type "<Amount>" in the "Amount" text field
    And I choose "<Reference rate>" in the "Reference rate" radio
    And I type "<Target margin>" in the "Target margin" text field
    And I choose "<Amortizing method>" in the "Amortizing method" radio

    And I click on the date picker's left arrow until the selected month is "<Target starting date>"
    And I click on the date picker's day "<Target starting date>"

    And I type "<YearTerm>" in the "Year Term" text field
    And I type "<MonthTerm>" in the "Month Term" text field

    And I choose "<Extension option>" in the "Extension option" radio

    And I choose "<Governing law>" in the "Governing law" dropdown
    And I choose "Standard LMA" in the "Documentation template" radio

    And I refresh the page

    Then "New" is chosen in the "Facility type" radio
    And "Start date of the existing facility" date picker is hidden
    And "<Currency>" is chosen in the "Currency" dropdown
    And I see "<Amount>" in the "Amount" text field
    And "<Reference rate>" is chosen in the "Reference rate" radio
    And I see "<target margin>" in the "Target margin" text field
    And "<Amortizing method>" is chosen in the "Amortizing method" radio
    And I see "<Target starting date>" in the "Target starting date" date picker
    And I see "<YearTerm>" in the "Year Term" text field
    And I see "<MonthTerm>" in the "Month Term" text field
    And "<Extension option>" is chosen in the "Extension option" radio
    And "<Governing law>" is chosen in the "Governing law" dropdown
    And "Standard LMA" is chosen in the "Documentation template" radio

    Examples:
      | Currency | Amount   | Reference rate | Target margin | Amortizing method | Target starting date | YearTerm | MonthTerm | Extension option | Governing law |
      | EUR      | 10000000 | Euribor        | 25            | Bullet            | 03/07/2017           | 5        | 6         | 1 year           | France        |
      | USD      | 20000000 | LIBOR          | 10            | Bullet            | 03/08/2017           | 1O       |           | 1 year + 1 year  | UK            |
      | EUR      |          |                |               |                   |                      |          |           |                  |               |


  Scenario Outline: date & number Fields validation

    Given I am a corporate
    And I am on the "Invite Coordinating Banks" page
    When I type "<Value>" in the "<FieldName>" text field
    And I click outside the "<FieldName>" field
    Then the "<FieldName>" text field displays the error message "<message>"

    Examples:
      | FieldName                           | Value     | message                                      |
      | Start date of the existing facility | adaijdiaj | Please enter a date in the MM/DD/YYYY format |
      | Target starting date                | adaijdiaj | Please enter a date in the MM/DD/YYYY format |
      | Amount                              | adaijdiaj | Please enter a number                        |
      | Target margin                       | adaijdiaj | Please enter a number                        |
# Check all fields are tested





