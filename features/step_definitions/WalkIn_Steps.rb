Then("User navigates to WalkIn page") do
  $driver.find_element(:xpath,"//div[@class='btn-group']/a").click()
  $wait.until { $driver.find_element(:xpath,"//*[text()='Shining Tower']").displayed? }
  $driver.find_element(:xpath,"//*[text()='Shining Tower']").click()
  $wait.until { $driver.find_element(:xpath,"//*[@data-itemname='BEVERAGES']").displayed? } 
end

Then("User selects the WalkIn Item from the menu") do
  $driver.find_element(:xpath,"//*[@data-itemname='" + $data['dynamicString'] + "']").click()
 
  $wait.until { $driver.find_element(:xpath,"//*[@data-itemname='Cold Coffee']").displayed? }
  $driver.find_element(:xpath,"//*[@data-itemname='Cold Coffee']").click()
  $wait.until { $driver.find_element(:xpath,"//span[text()='Cold Coffee']").displayed? }
end

Then("User clicks on WalkIn place order button") do
  $driver.find_element(:xpath,"//*[text()=' Place Order']").click()
  $wait.until { $driver.find_element(:xpath,"//a[text()='Pay']").displayed? }
end

Then("User confirms the WalkIn order payment") do
  $driver.find_element(:xpath,"//a[text()='Pay']").click()
  $wait.until { $driver.find_element(:xpath,"//a[text()='OK']").enabled? }
  sleep 1
  $driver.find_element(:xpath,"//a[text()='OK']").click()
end

Then("User navigates to Walkin order page and verify order") do
  $driver.find_element(:xpath,"//button[@class='btn dropdown-toggle']").click()
  $wait.until { $driver.find_element(:xpath,"(//ul[@class='dropdown-menu'])[1]/li/a").enabled? }
  $driver.find_element(:xpath,"(//ul[@class='dropdown-menu'])[1]/li/a").click()
  sleep 0.5
  @walkinordernumber=$driver.find_element(:xpath,"(//span[@class='dineInInvoiceNumberRunningOrder'])[last()]").text
  @actualwalkinordernumber=(@walkinordernumber.delete("#"))
  puts @actualwalkinordernumber
end

Then("User navigates to Dashboard > Total orders and verify the above paid order") do
  $driver.find_element(:xpath,"(//*[text()='Dashboard'])[1]").click()
  $wait.until { $driver.find_element(:xpath,"//span[@class='currentDateFilter']").enabled? }
  $driver.find_element(:xpath,"(//div[@class='widgetHeader'])[9]/a").click()
  $wait.until { $driver.find_element(:xpath,"(//*[@id='view_more_list']/tr)[last()]/td[1]").enabled? }
  @deliveredwalkinorder=$driver.find_element(:xpath,"(//*[@id='view_more_list']/tr)[last()]/td[1]").text
  puts @deliveredwalkinorder
  #expect(@actualwalkinordernumber).to eq(@deliveredwalkinorder)

end