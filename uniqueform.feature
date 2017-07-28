@uniqueUsageForm

Feature: potential coordinator bid for the syndication


  Background:  I access to the my banking pool table


  Scenario: Access to unique usage form from the received link

    Given I received the unique usage form link by mail
    When I click on the link
    Then I landed on the "uniqueFormPage" page

  Scenario: unique usage form initialization

    Given I am on "uniqueFormPage" page

    And I fill the following information

      | Lending entity name | Currency           | Maximum syndication size | Maximum number of banks | Final take | Tenor | Extension option | Underwriting | Agency role |

      | BNP Paribas         | USD - U.S. DOLLAR. | 500000000                | 4                       | 200000000  | 10    | 1 year           | Yes          | Yes         |

    And  I fill the following margin
      | Margin | Utilization fees | Commitment fees |
      | 175    | 61               | 4               |

    And I fill the following fees
      | Coordination fees | Up-front fees |
      | 200               | 150           |

    And i enter the following information in the Other information text field "test"


    When I click on Send button

    Then the bid is sent to the corporate request owner


  Scenario Outline: tenor Field validation

    Given I am on the "uniqueFormPage" page
    And I fill <tenorValue> on the "Tenor" field

    When i click outside the "Tenor" field
    Then I should see the following message error <message>

    Examples:
      | tenorValue | message                 |
      | adaijdiaj  | "Please enter a number" |
      | 10         |                         |

  Scenario Outline: final take Field validation

    Given I am on the "uniqueFormPage" page
    And I fill <finaltake> on the "Final take" field

    When i click outside the "Final take" field
    Then I should see the following message error <message>

    Examples:
      | finaltake | message                 |
      | adaijdiaj | "Please enter a number" |
      | 200000000 |                         |


  Scenario Outline: Maximum number of banks Field validation

    Given I am on the "uniqueFormPage" page
    And I fill <maximumNumberOfBanks> on the "Maximum number of banks" field

    When i click outside the "Maximum number of banks" field
    Then I should see the following message error <message>

    Examples:
      | maximumNumberOfBanks | message                 |
      | adaijdiaj            | "Please enter a number" |
      | 5                    |                         |


  Scenario Outline: Maximum syndication size Field validation

    Given I am on the "uniqueFormPage" page
    And I fill <size> on the "Maximum syndication size" field

    When i click outside the "Maximum syndication size" field
    Then I should see the following message error <message>

    Examples:
      | size      | message                 |
      | adaijdiaj | "Please enter a number" |
      | 500000000 |                         |