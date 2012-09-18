Feature: In order to track orders
  As a cafe staff member
  I want to create tickets for tables

  Background:
    Given the staff member "Yong"
      And I am logged in as "Yong"

  Scenario: Ticket creation
    Given I start a new ticket
      And I fill in the ticket details
    When  I save the ticket
    Then  I should see the ticket on the tickets page