##User Placing the order in CRM page##

Then("User clicks on Store Pickup button") do
  $driver.find_element(:xpath,"//a[@class='btn btn-link']").click() 
  $wait.until { $driver.find_element(:xpath,"//a[text()='Shining Tower']").displayed? }
  $driver.find_element(:xpath,"//a[text()='Shining Tower']").click() 
end


Then("User Navigates to Take away page") do
  $driver.find_element(:xpath,"//ul[@class='nav nav-pills pull-left']/li[2]").click()
  $wait.until { $driver.find_element(:xpath,"(//a[@class='btn btn-warning btn-block btnDMPayNow'])[last()]").enabled? }
end

Then("User clicks on Customer collected button") do
  $driver.find_element(:xpath,"(//a[@class='btn btn-warning btn-block btnDMPayNow'])[1]").click()
  $wait.until { $driver.find_element(:xpath,"//button[@type='submit']").displayed? }
  sleep 1
end
