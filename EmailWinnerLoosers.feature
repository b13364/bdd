@RFP
Feature: [SMARTF-X] E-mail Winner & Loosers

  As a coordinator
  I want to be able to prepare the Winner and loosers email
  So that I can send it from my mailbox a positive respond to the final coordinator and a negative respond to the non selected bidders



   Scenario: Validation and access to the replies to the RFP's recipients step
     Given Loading invite coordinating banks selection's information from standard test data
     And I am a coordinator
     And I am on the "Select coordinating bank" page
     And I check the received NDA checkbox
     And I click on "Send" button of the "BNP Paribas" bank
     And I click on the "Select" radio button of the "BNP Paribas" bank
     When I click on the "Validate" button
     Then I landed in the "RepliesRecipients" page
     And I see "bnpp@gmail.com" in "To" field on the "To the coordinator" section
     And I see "Coordinating bank" in "Subject" field on the "To the coordinator" section
     And In the "To the coordinator" mail body , I see
         """
     Dear Mr / Mrs [insert Bank’s RM name]

     We acknowledge receipt of your bid and are pleased to inform that we have decided to appoint your
     institution as Coordinating Bank for the [renewal]/[establishment] of a [Insert Cur] [Insert Amount]
     revolving credit facility for [insert legal name of the Corporate].
     Please find attached a draft Mandate documenting this appointment, for your review and execution

     Please do not hesitate to contact [insert contact name] with any question

     Best regards,

     [insert Corporate officer’s name]
         """

     And I see "hsbc@gmail.com, sg@gmail.com" in "To" field on the "To the non-selected bidders" section
     And I see "Coordinating bank" in "Subject" field on the "To the non-selected bidders" section
     Then In the "To the non-selected bidders" mail body, I see

         """
     Dear Mr / Mrs [insert Bank’s RM name]


     We thank you for bidding for a Coordinating role in the [renewal]/[establishment] of a [Insert Cur]
     [Insert Amount] revolving credit facility for [insert legal name of the Corporate].
     Unfortunately, we are sorry to inform that we have not selected your institution for this role this time.

     We will now start building the syndicate and will be delighted to count your institution as a participant in the syndicate.
     You will soon receive an e-mail from the mandated [insert name of the Coordinating Bank] to participate in the facility.

     Meanwhile, please do not hesitate to contact [insert contact name] with any question

     Best regards,

     [insert Corporate officer’s name]
         """


    #testing the fact of opening the corporate mailbox with the right information copied from the E-mail preparation page

  Scenario: "To the coordinator" opening mail
    Given Loading invite coordinating banks selection's information from standard test data
    And I am a coordinator
    And I am on the "Select coordinating bank" page
    And I check the received NDA checkbox
    And I click on "Send" button of the "BNP Paribas" bank
    And I click on the "Select" radio button of the "BNP Paribas" bank
    And I click on the "Validate" button
    And I landed in the "RepliesRecipients" page
    When I click on the "Open Mail" button in the "To the coordinator" section
    Then I am redirected to the new mail screen of my mailbox with "bnpp@gmail.com" as recipient, "Coordinating bank" as Subject and the following body:
       """
       Dear Mr / Mrs [insert Bank’s RM name]

       We acknowledge receipt of your bid and are pleased to inform that we have decided to appoint your
       institution as Coordinating Bank for the [renewal]/[establishment] of a [Insert Cur] [Insert Amount]
       revolving credit facility for [insert legal name of the Corporate].
       Please find attached a draft Mandate documenting this appointment, for your review and execution

       Please do not hesitate to contact [insert contact name] with any question

       Best regards,

       [insert Corporate officer’s name]
       """

  Scenario: "To the non-selected bidders" opening mail
    Given Loading invite coordinating banks selection's information from standard test data
    And I am a coordinator
    And I am on the "Select coordinating bank" page
    And I check the received NDA checkbox
    And I click on "Send" button of the "BNP Paribas" bank
    And I click on the "Select" radio button of the "BNP Paribas" bank
    And I click on the "Validate" button
    And I landed in the "RepliesRecipients" page
    When I click on the "Open Mail" button in the "To the non-selected bidders" section
    Then I am redirected to the new mail screen of my mailbox with "hsbc@gmail.com, sg@gmail.com" as recipient, "Coordinating bank" as Subject and the following body:
       """
       Dear Mr / Mrs [insert Bank’s RM name]


       We thank you for bidding for a Coordinating role in the [renewal]/[establishment] of a [Insert Cur]
       [Insert Amount] revolving credit facility for [insert legal name of the Corporate].
       Unfortunately, we are sorry to inform that we have not selected your institution for this role this time.

       We will now start building the syndicate and will be delighted to count your institution as a participant in the syndicate.
       You will soon receive an e-mail from the mandated [insert name of the Coordinating Bank] to participate in the facility.

       Meanwhile, please do not hesitate to contact [insert contact name] with any question

       Best regards,

       [insert Corporate officer’s name]
       """

