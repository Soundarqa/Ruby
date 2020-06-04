Feature: CRM - Home Delivery


 Scenario: Verify user is able to place the order through CRM - Home Delivery process
 
 When User enters User Name
 And User enters Password 
 And User clicks on Login button
 
 Then User navigates to CRM page 
 And User enters the mobile number 
 And User clicks on Search button
 Then User clicks on Place new Order button
 And User selects the Item from the menu
 And User clicks on place order button
 And User clicks on confirm button and place the order
 
 Then User Navigates to Home Deliveries page under Delivery Manager option
 And User clicks on Ready button for the placed order 
 And User Navigates to Waiting for Pickup tab
 And User assigns the available driver to the order
 And User Navigates to Delivery - InProgress tab
 And Once the order is delivered, user clicks on Delivered button
 And User enters the payment method and confirms the payment
 
 Then User Naviagtes to Dashboard >Total orders and confirms the availability of above placed order
 And User logout from Sapaad application