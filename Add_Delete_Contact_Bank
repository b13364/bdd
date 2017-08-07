@RFP
Feature: [SMARTF] Potential Coordinators Selection

  As a Corporate
  I want to add a Coordinator Bank and a Contact in my wish list
  So that I can send a E-mail with NDA to be signed to the selected Potential Coordinators.

  Scenario: Add contact

    Given I am a corporate
    And I am on the "Invite Coordinating Banks" page
    And I click on the "Add Bank(s)" dropdown
    And I select "BNP Paribas" in the dropdown
    And I click on the "Add Bank(s)" dropdown
    And I select "HSBC" in the dropdown
    And I click on the "Add Bank(s)" dropdown
    And I select "Société Générale" in the dropdown
    And I fill the contact cards as follows:
      | Bank name        | First Name | Last Name | Position | E-mail         |
      | BNP Paribas      | Bim        | Tic       |          | bnpp@gmail.com |
      | HSBC             | Bam        | Tac       |          | hsbc@gmail.com |
      | Société Générale | Boum       | Tuc       |          | sg@gmail.com   |
    When I click on the "Add Contact" Button of "BNP Paribas card"
    Then I see contact cards as follows:
      | Bank name        | First Name | Last Name | Position | E-mail         |
      | BNP Paribas      | Bim        | Tic       |          | bnpp@gmail.com |
      | BNP Paribas      |            |           |          |                |
      | HSBC             | Bam        | Tac       |          | hsbc@gmail.com |
      | Société Générale | Boum       | Tuc       |          | sg@gmail.com   |

  Scenario: Delete contact

    Given I am a corporate
    And I am on the "Invite Coordinating Banks" page
    And I click on the "Add Bank(s)" dropdown
    And I select "BNP Paribas" in the dropdown
    And I click on the "Add Contact" Button of "BNP Paribas card"
    And I click on the "Add Bank(s)" dropdown
    And I select "HSBC" in the dropdown
    And I click on the "Add Bank(s)" dropdown
    And I select "Société Générale" in the dropdown
    And I fill the contact cards as follows:
      | Bank name        | First Name | Last Name | Position | E-mail         |
      | BNP Paribas      | Bim        | Tic       |          | bnpp@gmail.com |
      | BNP Paribas      | Ouloulou   | alala     |          | bnpp2@gmailcom |
      | HSBC             | Bam        | Tac       |          | hsbc@gmail.com |
      | Société Générale | Boum       | Tuc       |          | sg@gmail.com   |
    When I click on the "Delete" button of "BNP Paribas contact"
    Then I see contact cards as follows:
      | Bank name        | First Name | Last Name | Position | E-mail         |
      | BNP Paribas      | Bim        | Tic       |          | bnpp@gmail.com |
      | HSBC             | Bam        | Tac       |          | hsbc@gmail.com |
      | Société Générale | Boum       | Tuc       |          | sg@gmail.com   |


  Scenario: Delete Bank

    Given I am a corporate
    And I am on the "Invite Coordinating Banks" page
    And I click on the "Add Bank(s)" dropdown
    And I select "BNP Paribas" in the dropdown
    And I click on the "Add Contact" Button of "BNP Paribas card"
    And I click on the "Add Bank(s)" dropdown
    And I select "HSBC" in the dropdown
    And I click on the "Add Bank(s)" dropdown
    And I select "Société Générale" in the dropdown
    And I fill the contact cards as follows:
      | Bank name        | First Name | Last Name | Position | E-mail         |
      | BNP Paribas      | Bim        | Tic       |          | bnpp@gmail.com |
      | BNP Paribas      | Ouloulou   | alala     |          | bnpp2@gmailcom |
      | HSBC             | Bam        | Tac       |          | hsbc@gmail.com |
      | Société Générale | Boum       | Tuc       |          | sg@gmail.com   |
    When I click on the "Delete" button of "BNP Paribas bank card"
    Then I see contact cards as follows:
      | Bank name        | First Name | Last Name | Position | E-mail         |
      | HSBC             | Bam        | Tac       |          | hsbc@gmail.com |
      | Société Générale | Boum       | Tuc       |          | sg@gmail.com   |


