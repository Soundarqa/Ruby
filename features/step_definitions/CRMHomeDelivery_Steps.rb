#$data = YAML.load_file('C:/Man/SapaadWebAutomation/Config/config.yml')
#wait = Selenium::WebDriver::Wait.new(:timeout => 10)

##Login to Sapaad application##

When("User enters User Name") do
  $driver.find_element(:id,"user_email").send_keys($data['username'])
  $wait.until { $driver.find_element(:id, 'user_password').displayed? }
end

When("User enters Password") do
  $driver.find_element(:id,"user_password").send_keys($data['password'])
  $wait.until { $driver.find_element(:xpath,"(//*[text()='Log in'])[1]").displayed? }
end

Then("User clicks on Login button") do
 $driver.find_element(:xpath,"(//*[text()='Log in'])[1]").click()
 $wait.until { $driver.find_element(:xpath,"//*[text()='CRM']").displayed? }
end

##User Placing the order in CRM page##

Then("User navigates to CRM page") do
  $driver.find_element(:xpath,"//*[text()='CRM']").click()
  $wait.until { $driver.find_element(:xpath,"//*[@id='telephone']").displayed? }
end

Then("User enters the mobile number") do
  $driver.find_element(:xpath,"//*[@id='telephone']").send_keys($data['CustomerPhNumber'])
  $wait.until { $driver.find_element(:xpath,"//*[@name='button']").displayed? }
end

Then("User clicks on Search button") do
  $driver.find_element(:xpath,"//*[@name='button']").click()
  $wait.until { $driver.find_element(:xpath,"(//button[@type='submit'])[2]").displayed? }
end

Then("User clicks on Place new Order button") do
  $driver.find_element(:xpath,"(//button[@type='submit'])[2]").click()
  $wait.until { $driver.find_element(:xpath,"//*[@data-itemname='BEVERAGES']").displayed? }
end

Then("User selects the Item from the menu") do
  $driver.find_element(:xpath,"//*[@data-itemname='BEVERAGES']").click()
  $wait.until { $driver.find_element(:xpath,"//*[@data-itemname='Cold Coffee']").displayed? }
  $driver.find_element(:xpath,"//*[@data-itemname='Cold Coffee']").click()
  $wait.until { $driver.find_element(:xpath,"//span[text()='Cold Coffee']").displayed? } 
  $driver.find_element(:xpath,"//button[text()='Place Order']").click() 
  $wait.until { $driver.find_element(:id, 'referral_id').displayed? }
end

Then("User clicks on place order button") do
  ##Slelecting the referal
  dropdown_list = $driver.find_element(:id, 'referral_id')
  options = dropdown_list.find_elements(tag_name: 'option')
  options.each { |option| option.click if option.text == $data['ReferalName'] }

end

Then("User clicks on confirm button and place the order") do
  $driver.find_element(:xpath,"(//a[text()='Confirm'])[1]").click() 
  $wait.until { $driver.find_element(:xpath,"//ul[@class='nav tourTopNavigation']/li[6]/a").enabled? }
  sleep 1
end

Then("User Navigates to Home Deliveries page under Delivery Manager option") do
  $driver.find_element(:xpath,"//ul[@class='nav tourTopNavigation']/li[6]/a").click()
  $driver.find_element(:xpath,"//ul[@class='dropdown-menu subMenuLocation']/li[1]/a").click()
  $wait.until { $driver.find_element(:xpath,"//a[@class='btnLocationSelection']/h2").displayed? }
  $driver.find_element(:xpath,"//a[@class='btnLocationSelection']/h2").click()
  $driver.find_element(:xpath,"(//ul[@class='dropdown-menu'])[3]/li[5]").click()
end

Then("User clicks on Ready button for the placed order") do
  $driver.find_element(:xpath,"(//button[@type='submit'])[1]").click()
  $wait.until { $driver.find_element(:xpath,"//*[text()='Waiting for Pick ']").enabled? }
  sleep 1
end

Then("User Navigates to Waiting for Pickup tab") do
  $driver.find_element(:xpath,"//*[text()='Waiting for Pick ']").click()
  $wait.until { $driver.find_element(:id,'selected_driver').displayed? }
end

Then("User assigns the available driver to the order") do
  driver_list = $driver.find_element(:id, 'selected_driver')
  options = driver_list.find_elements(tag_name: 'option')
  options.each { |option| option.click if option.text == $data['DiverName'] }
  $wait.until { $driver.find_element(:xpath,"(//button[@type='submit'])[1]").displayed? }
  $driver.find_element(:xpath,"(//button[@type='submit'])[1]").click()
  $wait.until { $driver.find_element(:xpath,"//*[text()='Delivery - InProgress ']").enabled? }
  sleep 1
end

Then("User Navigates to Delivery - InProgress tab") do
  $wait.until { $driver.find_element(:xpath,"//*[text()='Delivery - InProgress ']").enabled? }
  $driver.find_element(:xpath,"//*[text()='Delivery - InProgress ']").click()
  $wait.until { $driver.find_element(:xpath,"(//*[text()='Delivered?'])[1]").enabled? }
end

Then("Once the order is delivered, user clicks on Delivered button") do
  $driver.find_element(:xpath,"(//*[text()='Delivered?'])[1]").click()
  $wait.until { $driver.find_element(:xpath,"//button[@type='submit']").displayed? }
end

Then("User enters the payment method and confirms the payment") do
  $driver.find_element(:xpath,"//button[@type='submit']").click()
  $wait.until { $driver.find_element(:xpath,"//a[text()='OK']").displayed? }
  $driver.find_element(:xpath,"//a[text()='OK']").click()
end

Then("User Naviagtes to Dashboard >Total orders and confirms the availability of above placed order") do
  $driver.find_element(:xpath,"(//*[text()='Dashboard'])[1]").click()
  $wait.until { $driver.find_element(:xpath,"(//*[@class='currentDateFilter'])").enabled? }
end

Then("User logout from Sapaad application") do

end