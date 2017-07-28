@SelectMainCovenants
Feature: [SMARTF-55] Covenants form

  As a Corporate
  I want to start filling covenants data
  So that I can include them in the termsheet

  # covenants selected by default

  Scenario: Validation and access to the Select main covenants step with default value chosen

    Given Loading invite coordinating banks selection's information from standard test data
    And I am a coordinator
    And I am on the "Select coordinating bank" page

    When I click on the "Validate" button

    Then I landed in the "Select Main Covenants" page

      # Financial Covenants
    And the "Interest cover ratio" checkbox is checked
    And the "Interest cover ratio" text field is activated

    And the "Net debt to EBITDA" checkbox is checked
    And the "Net debt to EBITDA" text field is activated

    And the "Net service ratio" checkbox is un unchecked
    And the "Net service ratio" text field is disabled

    And the "Max capex" checkbox is checked
    And the "Max capex" text field is activated

    # Information undertakings
    And "IFRS" is chosen in the "Financial statement" radio
    And "Semi-annual" is chosen in the "Frequency" radio

    # Reps & General Undertakings
    And the "Merger" checkbox is unchecked
    And the "Negative pedge" checkbox is unchecked
    And the "Pari Passu" checkbox is checked

    # Events of default
    And the "Change of control" checkbox is unchecked
    And the "Cross default" checkbox is checked
    And the "Illegality" checkbox is unchecked
    And the "Insolvency" checkbox is unchecked
    And the "Material adverse change" checkbox is unchecked

    # Others
    And the "Conditions to transfer" checkbox is checked
    And the "Increased cost" checkbox is unchecked
    And the "FATCA" checkbox is checked
    And the "Majority" checkbox is unchecked
    And the "Sanctions" checkbox is unchecked
    And the "Bor floors" checkbox is unchecked

    # Comments section
    And I see "Add a comment" in the "Additional comments" text field

    # Termsheet section
    And the "Include covenants" checkbox is unchecked



  # covenants initialization scenario
  Scenario Outline: covenants initialization and data persistence with all missing fields

    Given I am a corporate
    And I am on the "Select main covenant" page

    When I uncheck "Interest cover ratio" checkbox

    And I check "Net service ratio" checkbox
    And i type "<NetServiceValue>" in the "Net service ratio" text field


    And I choose "GAAP" in the "Financial statement" radio
    And I choose "Quarterly" in the "Frequency" radio

    And I uncheck "Pari Passu" checkbox

    And I check "Change of control" checkbox
    And I check "Increased cost" checkbox

    And type "This is a test for an additional comment" in the "Additional comments" text field

    And I refresh the page

    Then the "Interest cover ratio" checkbox is unchecked
    And the "Interest cover ratio" text field is disabled

    And the "Net debt to EBITDA" checkbox is checked
    And the "Net debt to EBITDA" text field is activated

    And the "Net service ratio" checkbox checked
    And the "Net service ratio" text field is activated

    And the "Max capex" checkbox is checked
    And the "Max capex" text field is activated

    # Information undertakings
    And "GAAP" is chosen in the "Financial statement" radio
    And "Quarterly" is chosen in the "Frequency" radio

    # Reps & General Undertakings
    And the "Merger" checkbox is unchecked
    And the "Negative pedge" checkbox is unchecked
    And the "Pari Passu" checkbox is unchecked

    # Events of default
    And the "Change of control" checkbox is checked
    And the "Cross default" checkbox is checked
    And the "Illegality" checkbox is unchecked
    And the "Insolvency" checkbox is unchecked
    And the "Material advserse change" checkbox is unchecked

    # Others
    And the "Conditions to transfer" checkbox is checked
    And the "Increased cost" checkbox is checked
    And the "FATCA" checkbox is checked
    And the "Majority" checkbox is unchecked
    And the "Sanctions" checkbox is unchecked
    And the "Bor floors" checkbox is unchecked

    # Comments section
    And I see "This is a test for an additional comment" in the "Additional comments" text field

    # Termsheet section
    And the "Include covenants" checkbox is unchecked


  Scenario Outline: number Fields validation

    Given I am a corporate
    And I am on the "Select main covenant" page
    When I type "<Value>" in the "<FieldName>" text field
    And I click outside the "<FieldName>" field
    Then the "<FieldName>" text field displays the error message "<message>"

    Examples:
      | FieldName            | Value     | message               |
      | Interest cover radio | adaijdiaj | Please enter a number |
      | Net debt to EBITDA   | adaijdiaj | Please enter a number |
      | Net service ratio    | adaijdiaj | Please enter a number |
      | Max capex            | adaijdiaj | Please enter a number |





# Check all fields are tested
