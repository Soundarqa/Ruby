Feature: Online - Take Away


 Scenario: Verify user is able to place the order through Online Take Away process
 
 When User enters User Name
 And User enters Password
 And User clicks on Login button

 Then User navigates to Online application in different browser tab
 And User login to the Sapaad online application
 And User selects the location and Online Item from the menu
 And User proceed to checkout and Payment
 And User confirms the Online order payment
 And User navigates to Track Order page
 
 Then User navigates to POS Online page and confirms the order
 And User Verifies the status of order in Online page
 
 Then User navigates to Takeaway orders > Home Delivery Page in POS application
 And User clicks on Customer collected button
 And User enters the payment method and confirms the payment
 And User verifies the delivered status of order in Online page
 
