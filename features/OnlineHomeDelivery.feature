Feature: Online - Home Delivery


 Scenario: Verify user is able to place the order through Online Home Delivery process
 
 When User enters User Name
 And User enters Password 
 And User clicks on Login button
 
 Then User navigates to Online application in different tab
 And User login to the Sapaad online application
 And User selects the location and Online Item from the menu
 And User proceed to checkout and Payment
 And User confirms the Online order payment
 And User navigates to Track Order page
 
 Then User navigates to POS Online page and confirms the order
 And User Verifies the status of order in Online page
 And User navigates to Delivery Manager > Home Delivery Page in POS application
 And User confirms the Order is ready for delivery
 
 Then User assigns the delivery person for the prepared order
 And User Verifies the delivery-status of order in Online page
 
 Then User delivered the order to the customer
 And User Confirms the payment
 And User verifies the delivered status of order in Online page