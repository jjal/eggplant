Scenario: export to Excel
  When I go to the payslip page
  And I follow "Export"
  Then I should download an Excel document