Feature:
  In order to take orders
  Yong wants to add items to a ticket

  Background:
    Given the staff member "Yong"
      And I am logged in as "Yong"

  Scenario: Ticket creation
    Given I start a new ticket
      And I fill in the ticket details
    When  I save the ticket
    Then  I should see the ticket on the tickets page