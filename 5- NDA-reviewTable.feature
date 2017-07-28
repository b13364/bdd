@SelectCoordinatingBank
Feature:
  As a coordinator
  i want to be able to review potential coordinator table
  so that i can mention who signed the NDA And i can send them the unique usage form

  # Describe how the user arrived there (sentence about standard test data)
  # sentence is: Loading "invite coordinating banks" information from standard test data


  Scenario: Access to the "Answer/Review Table" page and Display bank selection table
    Given Loading "invite coordinating banks" information from standard test data
    And I am a coordinator
    And I am on the "Invite Coordinating Banks" page
    When I click on "Answer Table" button
    Then I landed in the "Answer/Review Table" page
    And I see a table with the following fields:
      | Received NDA (CheckBox) | RFP Form | Banks            | Commitment fees | Initial margin | Upfront fees | All in cost at target utilization rate | Underwriting | Select (Radio Button) |
      | unchecked               | -        | BNP Paribas      |                 |                |              |                                        |              | -                     |
      | unchecked               | -        | HSBC             |                 |                |              |                                        |              | -                     |
      | unchecked               | -        | Société Générale |                 |                |              |                                        |              | -                     |


  Scenario: Send button activation after NDA reception
    Given Loading "invite coordinating banks" information from standard test data
    And I am a coordinator
    And I am on the "Answer/Review Table" page
    When I check the "received NDA" checkbox of the "BNP Paribas" bank
    And I check the "received NDA" checkbox of the "HSBC" bank

    Then I see a table with the following fields:
      | Received NDA(CheckBox) | RFP Form | Banks            | Commitment fees | Initial margin | Upfront fees | All in cost at target utilization rate | Underwriting | Select (Radio Button) |
      | checked                | Send     | BNP Paribas      |                 |                |              |                                        |              | -                     |
      | checked                | Send     | HSBC             |                 |                |              |                                        |              | -                     |
      | unchecked              | -        | Société Générale |                 |                |              |                                        |              | -                     |


  Scenario: Get static information after clicking "Send" button + Radio button display
    Given Loading "invite coordinating banks" information from standard test data
    And I am a coordinator
    And the current date is "07/28/2017"
    And I am on the "Answer/Review Table" page
    And I check the "received NDA" checkbox
    When I click on "Send" button
    Then I see a table with the following fields:
      | Received NDA (CheckBox) | RFP Form   | Banks            | Commitment fees | Initial margin | Upfront fees | All in cost at target utilization rate | Underwriting | Select (Radio Button) |
      | checked and disabled    | 07/28/2017 | BNP Paribas      | 15              | 20             | 10           | 3,2                                    | No           | unchecked             |
      | unchecked               | -          | HSBC             |                 |                |              |                                        |              | -                     |
      | unchecked               | -          | Société Générale |                 |                |              |                                        |              | -                     |

    And the "Number of NDA received" is incremented by one
    And the "Number of bids received" is incremented by one

  Scenario: Coordinating bank selection and validation button activation
    Given Loading "invite coordinating banks" information from standard test data
    And I am a coordinator
    And I am on the "Answer/Review Table" page
    And the current date is "07/28/2017"
    And I check the "received NDA" checkbox
    And I click on "Send" button
    When I click on the "Select" radio button
    Then I see a table with the following fields:
      | Received NDA (CheckBox) | RFP Form   | Banks            | Commitment fees | Initial margin | Upfront fees | All in cost at target utilization rate | Underwriting | Select (Radio Button) |
      | checked and disabled    | 07/28/2017 | BNP Paribas      | 15              | 20             | 10           | 3,2                                    | No           | checked               |
      | unchecked               | -          | HSBC             |                 |                |              |                                        |              | -                     |
      | unchecked               | -          | Société Générale |                 |                |              |                                        |              | -                     |

    And the "Validate" button is enabled



#  Scenario: Increments of NDA counter
#    Given I am on the  "Answer/Review Table" page
#    When I check the "received NDA" checkbox
#    Then The "Number of NDA received" is incremented by one.
#    And The button "Send form" appears
#
#
#  Scenario: Decrements of NDA counter
#    Given i am on the  "Answer/Review Table" page
#    When I check the "received NDA" checkbox
#    Then the "Number of NDA received" is decremented by one.
#    And the button "Send form" disappears