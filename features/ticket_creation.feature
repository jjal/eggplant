Feature:
  In order to track orders
  Yong wants to create tickets for tables

  Background:
    Given I am logged in as "Yong"
      And there is a ticket for table 2
      And "Banana Bread" and "Cafe Latte" are on the menu

  Scenario: Adding an order to a ticket
    Given I open the ticket for table 2
      And I add "Banana Bread" and "Cafe Latte"
    Then  I should see "Banana Bread" and "Cafe Latte" on the ticket