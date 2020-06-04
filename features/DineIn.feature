Feature: DineIn


 Scenario: Verify user is able to place the order through DineIn process
 
 When User enters User Name
 And User enters Password 
 And User clicks on Login button
 
 Then User navigates to DineIn page 
 And User Selects the table 
 And User selects the DineIn Item from the menu
 Then User selects the table cover
 And User clicks on Dine In place order button
 
 Then User Navigates to the Running Orders
 And User prints the bill
 And User confirms the payment
 
 Then Verify that table is available for next order
 And User logout from Sapaad application