Feature: Login user

  Background:

    Given the following users exists:
      | email           | password |
      | mail_1@email.ru | hello    |
      | mail_2@email.ru | hello    |
      | mail_3@email.ru | hello    |

  Scenario: login
    When user with email "mail_1@email.ru"
