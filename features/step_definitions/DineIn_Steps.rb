Then("User navigates to DineIn page") do
  $driver.find_element(:xpath,"//*[text()='Dine-In']").click()
  $wait.until { $driver.find_element(:xpath,"//*[text()='Shining Tower']").displayed? }
  $driver.find_element(:xpath,"//*[text()='Shining Tower']").click()
  $wait.until { $driver.find_element(:xpath,"(//*[@class='tableselectioncontainer row-fluid']/a)[1]").displayed? }
end

Then("User Selects the table") do
  $driver.find_element(:xpath,"(//*[@class='tableselectioncontainer row-fluid']/a)[1]").click()
  $wait.until { $driver.find_element(:xpath,"//*[@data-itemname='BEVERAGES']").displayed? }
  
end

Then("User selects the DineIn Item from the menu") do
  $driver.find_element(:xpath,"//*[@data-itemname='BEVERAGES']").click()
  $wait.until { $driver.find_element(:xpath,"//*[@data-itemname='Cold Coffee']").displayed? }
  $driver.find_element(:xpath,"//*[@data-itemname='Cold Coffee']").click()
  $wait.until { $driver.find_element(:xpath,"//span[text()='Cold Coffee']").displayed? }
end

Then("User selects the table cover") do
  $driver.find_element(:xpath,"//div[@class='btn-group noMargin']/a").click()
  $driver.find_element(:xpath,"//ul[@class='dropdown-menu customDropDown']/li[2]").click()  
end

Then("User clicks on Dine In place order button") do
  $driver.find_element(:xpath,"//button[@class='btn btn-success btn-block btn-large orderButtonDineInTop btnDineInButtonStyle ']").click()
  $wait.until { $driver.find_element(:xpath,"(//*[@class='tableselectioncontainer row-fluid']/a)[1]").displayed? }
end

Then("User Navigates to the Running Orders") do
  $driver.find_element(:xpath,"//*[text()='Running Orders']").click()
  $wait.until { $driver.find_element(:xpath,"//*[text()=' Print Bill']").displayed? }
  @ordernumber=$driver.find_element(:xpath,"//span[@class='dineInInvoiceNumberRunningOrder']").text
end

Then("User prints the bill") do
  $driver.find_element(:xpath,"//*[text()=' Print Bill']").click()
  $wait.until { $driver.find_element(:xpath,"//*[text()=' PAY']").displayed? }
end

Then("User confirms the payment") do
  $driver.find_element(:xpath,"//*[text()=' PAY']").click()
  $wait.until { $driver.find_element(:xpath,"//button[text()='Pay']").displayed? }
  $driver.find_element(:xpath,"//button[text()='Pay']").click()
  $wait.until { $driver.find_element(:xpath,"//a[text()='OK']").displayed? }
  $driver.find_element(:xpath,"//a[text()='OK']").click()
  $driver.find_element(:xpath,"//div[@class='dineInRunningOrderHeader clearfix']/h2").click()  
end

Then("Verify that table is available for next order") do
  $driver.find_element(:xpath,"//*[text()='Completed Orders']").click()
  $wait.until { $driver.find_element(:xpath,"(//*[text()='Paid'])[1]").displayed? }
  $wait.until { $driver.find_element(:xpath,"(//span[@class='dineInInvoiceNumberRunningOrder'])[last()]").displayed? }
  @deliveredordernumber=$driver.find_element(:xpath,"(//span[@class='dineInInvoiceNumberRunningOrder'])[last()]").text
  expect(@ordernumber).to eq(@deliveredordernumber)
end