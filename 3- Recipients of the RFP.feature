@RFP
Feature: [SMARTF-X] Potential Coordinators Selection

  As a Corporate
  I want to add a Coordinator Bank and a Contact in my wish list
  So that I can send a E-mail with NDA to be signed to the selected Potential Coordinators.


  Scenario: Coordinating Bank and emergence of a Bank contact sub-section

    Given I am a corporate
    And I am on the "Invite Coordinating Banks" page
    And the "Recipients of the RFP" section is opened
    When I click on the "Add Bank(s)" dropdown
    And I select "BNP Paribas" in the dropdown
    When I click on the "Add Bank(s)" dropdown
    And I select "HSBC" in the dropdown
    When I click on the "Add Bank(s)" dropdown
    And I select "Société Générale" in the dropdown
    Then I see contact cards with the following text fields:
      | Bank name        | First Name | Last Name | Position | E-mail |
      | BNP Paribas      |            |           |          |        |
      | HSBC             |            |           |          |        |
      | Société Générale |            |           |          |        |


  Scenario: Persistance: 1 coordinating Bank and 1 contact

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
    And I refresh the page
    Then I see contact cards as follows:
      | Bank name        | First Name | Last Name | Position | E-mail        |
      | BNP Paribas      | Bim        | Tic       |          | bnpp@gmail.com  |
      | HSBC             | Bam        | Tac       |          | hsbc@gmail.com  |
      | Société Générale | Boum       | Tuc       |          | sg@gmail.com    |


  Scenario Outline: E-mail field validation

    Given I am a corporate
    And I am on the "Invite Coordinating Banks" page
    And the "Recipients of the RFP" section is opened
    And I click on the "Add Bank(s)" dropdown
    And I select "BNP Paribas" in the dropdown
    And I type "<Value>" in the "E-mail" text field
    And I click outside the "E-mail" field
    Then the "E-mail" text field displays the error message "<message>"

    Examples:
      | Value                | message                       |
      | a.b                  | "Please enter a valid E-mail" |
      | a@b                  | "Please enter a valid E-mail" |
      | John.doe@gE-mail.com |                               |




