Feature: Register new user

  Scenario: registration form should exists
    Given the home page
    When we click to "Sign Up" button
    Then we should see registration form

  Scenario: new user should be able to register
    Given the registration page
    When we fill registration form
    And click to "Register" button
    Then we should redirect to files list page

  Scenario: we should not create the same user twice
    Given register new user
    Given the registration page
    When we fill registration form with registered user email
    And click to "Register" button
    Then we should see error message

