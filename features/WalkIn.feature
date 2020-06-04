Feature: WalkIn


 Scenario: Verify user is able to place the order through WalkIn process
 
 When User enters User Name
 And User enters Password 
 And User clicks on Login button
 
 Then User navigates to WalkIn page 
 And User selects the WalkIn Item from the menu
 And User clicks on WalkIn place order button
 And User confirms the WalkIn order payment
 
 Then User navigates to Walkin order page and verify order
 And User navigates to Dashboard > Total orders and verify the above paid order
 And User logout from Sapaad application