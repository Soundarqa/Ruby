Feature: CRM - Take away


 Scenario: Verify user is able to place the order through CRM - Take Away process
 
 When User enters User Name
 And User enters Password 
 And User clicks on Login button
 
 Then User navigates to CRM page 
 And User enters the mobile number 
 And User clicks on Search button
 Then User clicks on Store Pickup button
 And User selects the Item from the menu
 And User clicks on place order button
 And User clicks on confirm button and place the order

And User navigates to Takeaway orders > Home Delivery Page
And User clicks on Customer collected button
And User enters the payment method and confirms the payment

Then User Naviagtes to Dashboard >Total orders and confirms the availability of above placed order
And User logout from Sapaad application