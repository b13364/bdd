@RFP
Feature: [SMARTF-X] E-mail Preparation

  As a coordinator
  I want to be able to prepare the NDA email
  So that I can send it from my mailbox to the potential coordinator bank pool to be signed


  Scenario: Get contact info from Select Recipients of the RFP page and send email with information

    Given I am on the "Invite Coordinating Banks" page
    And the "Select Recipients of the RFP" section is opened

    When I choose "BNP Paribas" in the "Select Recipients of the RFP" dropdown
    And I fill the "BNP Paribas" contact card as follows:
      | Firstname | Lastname | Job | Mail               |
      | John      | Doe      | CEO | John.doe@gmail.com |
    And I click on the "Next" button in the "Select Recipients of the RFP" section

    Then I see "John.doe@gmail.com" in the "To" text field
    And I see "Coordinator invitation" in the "Subject" text field
    
    #taking into consideration reply by date in the e-mail body 
    
    When I open the "Please reply by" date picker
    And I click on the date picker's right arrow until the selected month is "June 2017"
    And I click on the date picker's day "28"

    Then In the coordinator's invitation mail body, I see
    """
      This is a NDA, please reply by 06/28/2017.
    """

    #testing the fact of opening the corporate mailbox with the right information copied from the E-mail preparation page

    When I click on the "Send" button in the "E-mail Preparation" section

    Then I am redirected to the new mail screen of my mailbox with "John.doe@gmail.com" as recipient, "Coordinator invitation" as Subject and the following body:
    """
      This is a NDA, please reply by 06/28/2017.
    """
