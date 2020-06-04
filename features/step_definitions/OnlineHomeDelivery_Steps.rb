Then("User navigates to Online application in different tab") do
  $driver.execute_script('window.open("https://app.sapaad-review.online?apk=6a4c55329656909a1f131efb6e16db1f")')
  $windowhandles = $driver.window_handles
  $driver.switch_to.window($windowhandles[1])
  $wait.until { $driver.find_element(:xpath, "//*[text()='Sign In / Register']").enabled? }
end

Then("User login to the Sapaad online application") do
  $driver.find_element(:xpath,"//*[text()='Sign In / Register']").click()
  $wait.until { $driver.find_element(:id, "phone").enabled? }
  $driver.find_element(:id, "phone").send_keys($OnlineHomeDelivery['Onlineusername']) 
  $driver.find_element(:xpath, "//*[@type='submit']").click()
  $wait.until { $driver.find_element(:id, "password").displayed? }
  sleep 0.5
  $driver.find_element(:id, "password").send_keys($OnlineHomeDelivery['Onlinepassword'])
  $wait.until { $driver.find_element(:xpath, "//*[@type='submit']").enabled? } 
  $driver.find_element(:xpath, "//*[@type='submit']").click()
  $wait.until { $driver.find_element(:xpath, "(//*[@class='btn-add'])[1]").enabled? } 
end

Then("User selects the location and Online Item from the menu") do
  $driver.find_element(:xpath, "(//*[@class='btn-add'])[1]").click()
  $wait.until { $driver.find_element(:xpath, "//input[@type='text']").enabled? }
  $driver.find_element(:xpath, "//input[@type='text']").send_keys($OnlineHomeDelivery['Onlinelocation'])
  $wait.until { $driver.find_element(:xpath, "//*[@class='rbt-highlight-text']").displayed? }
  $driver.find_element(:xpath, "//*[@class='rbt-highlight-text']").click() 
  $wait.until { $driver.find_element(:xpath, "//input[@class='btn btn-success']").enabled? }
  $driver.find_element(:xpath, "//input[@class='btn btn-success']").click()
  $wait.until { $driver.find_element(:id, "continueToDelivery").enabled? }
  sleep 1 
end

Then("User proceed to checkout and Payment") do
  $driver.find_element(:id, "continueToDelivery").click()
  $wait.until { $driver.find_element(:xpath, "//a[@class='btn btn-success']").enabled? } 
  $driver.find_element(:xpath, "//a[@class='btn btn-success']").click()
  $wait.until { $driver.find_element(:xpath, "//*[@class='btn btn-success ']").enabled? }
  sleep 2
end

Then("User confirms the Online order payment") do
  $driver.find_element(:xpath, "//*[text()='Cash on Delivery']").click()
  $driver.find_element(:xpath, "//*[@value='CONFIRM ORDER']").click()
  $wait.until { $driver.find_element(:xpath, "//a[@class='btn btn-success']").enabled? }
  sleep 1
  
end

Then("User navigates to Track Order page") do
  $wait.until { $driver.find_element(:xpath, "//a[@class='btn btn-success']").enabled? }
  sleep 2
  $driver.find_element(:xpath, "//a[@class='btn btn-success']").click()
  $wait.until { $driver.find_element(:id, "track_order").enabled? }
  @placedordernumber=$driver.find_element(:xpath,"//*[@class='status-opener']").text()
  @actualplacedordernumber=(@placedordernumber.delete("Order Number: "))
end

Then("User navigates to POS Online page and confirms the order") do
  $windowhandles = $driver.window_handles
  $driver.switch_to.window($windowhandles[0])
  $wait.until { $driver.find_element(:xpath, "(//a[text()='Online'])[1]").enabled? }
  
  $driver.find_element(:xpath,"(//a[text()='Online'])[1]").click()
  $wait.until { $driver.find_element(:xpath, "//a[@class='btnLocationSelection']/h2").enabled? }
  $driver.find_element(:xpath,"//a[@class='btnLocationSelection']/h2").click()
  $driver.find_element(:xpath,"(//ul[@class='dropdown-menu'])[3]/li[5]").click()
  $wait.until { $driver.find_element(:xpath, "(//span[text()='Review'])[last()]").enabled? }
  
  $driver.find_element(:xpath,"(//span[text()='Review'])[last()]").click()
  $wait.until { $driver.find_element(:xpath, "//span[text()='Confirm']").enabled? }
  $driver.find_element(:xpath,"//span[text()='Confirm']").click()
  $wait.until { $driver.find_element(:xpath, "//a[@class='btnLocationSelection']/h2").enabled? }
end

Then("User Verifies the status of order in Online page") do
  $windowhandles = $driver.window_handles
  $driver.switch_to.window($windowhandles[1])
  $wait.until { $driver.find_element(:xpath, "//strong[text()='Order confirmed!']").enabled? }
end

Then("User navigates to Delivery Manager > Home Delivery Page in POS application") do
  $windowhandles = $driver.window_handles
  $driver.switch_to.window($windowhandles[0])
  $wait.until { $driver.find_element(:xpath,"//ul[@class='nav tourTopNavigation']/li[6]/a").displayed? }
  sleep 1
  $driver.find_element(:xpath,"//ul[@class='nav tourTopNavigation']/li[6]/a").click()
  $driver.find_element(:xpath,"//ul[@class='dropdown-menu subMenuLocation']/li[1]/a").click()
  $wait.until { $driver.find_element(:xpath,"//a[@class='btnLocationSelection']/h2").displayed? }
end

Then("User confirms the Order is ready for delivery") do
  $wait.until { $driver.find_element(:xpath,"(//button[@type='submit'])[1]").displayed? }
  $driver.find_element(:xpath,"(//button[@type='submit'])[1]").click()
  $wait.until { $driver.find_element(:xpath,"//*[text()='Waiting for Pick ']").enabled? }
  sleep 1 
end

Then("User assigns the delivery person for the prepared order") do
  $driver.find_element(:xpath,"//*[text()='Waiting for Pick ']").click()
  $wait.until { $driver.find_element(:id,'selected_driver').displayed? }
  driver_list = $driver.find_element(:id, 'selected_driver')
  options = driver_list.find_elements(tag_name: 'option')
  options.each { |option| option.click if option.text == $data['DiverName'] }
  $wait.until { $driver.find_element(:xpath,"(//button[@type='submit'])[1]").displayed? }
  $driver.find_element(:xpath,"(//button[@type='submit'])[1]").click()
  $wait.until { $driver.find_element(:xpath,"//*[text()='Delivery - InProgress ']").enabled? }
  sleep 1
end

Then("User Verifies the delivery-status of order in Online page") do
  $windowhandles = $driver.window_handles
  $driver.switch_to.window($windowhandles[1])
  sleep 1
end

Then("User delivered the order to the customer") do
  $windowhandles = $driver.window_handles
  $driver.switch_to.window($windowhandles[0])  
  $wait.until { $driver.find_element(:xpath,"//*[text()='Delivery - InProgress ']").enabled? }
  $driver.find_element(:xpath,"//*[text()='Delivery - InProgress ']").click()
  $wait.until { $driver.find_element(:xpath,"(//*[@data-from='delivery']/strong)[1]").enabled? }
  $driver.find_element(:xpath,"(//a[@class='btn btn-success btn-block btn_deliver text-center delManLabelStat btnDMPayNow'])[1]").click()
  $wait.until { $driver.find_element(:xpath,"//button[@type='submit']").displayed? }
end

Then("User Confirms the payment") do
  $driver.find_element(:xpath,"//button[@type='submit']").click()
  $wait.until { $driver.find_element(:xpath,"//a[text()='OK']").displayed? }
  $driver.find_element(:xpath,"//a[text()='OK']").click()
end

Then("User verifies the delivered status of order in Online page") do
  $windowhandles = $driver.window_handles
  sleep 1
  $driver.switch_to.window($windowhandles[1])
  $driver.find_element(:id,"track_order").click()
  #$wait.until { $driver.find_element(:xpath, "(//strong[text()='Enjoy your meal and order again.'])[2]").enabled? }
end