

Then("User navigates to Online application in different browser tab") do
  $driver.execute_script('window.open("https://app.sapaad-review.online?apk=6a4c55329656909a1f131efb6e16db1f")')
  $windowhandles = $driver.window_handles
  $driver.switch_to.window($windowhandles[1])
  sleep 1
end

Then("User navigates to Takeaway orders > Home Delivery Page") do
  $driver.find_element(:xpath,"//ul[@class='nav tourTopNavigation']/li[6]/a").click()
  $driver.find_element(:xpath,"//ul[@class='dropdown-menu subMenuLocation']/li[1]/a").click()
  $wait.until { $driver.find_element(:xpath,"//a[@class='btnLocationSelection']/h2").displayed? }
  $driver.find_element(:xpath,"//ul[@class='nav nav-pills pull-left']/li[2]").click()
  $driver.find_element(:xpath,"//a[@class='btnLocationSelection']/h2").click()
  $driver.find_element(:xpath,"(//ul[@class='dropdown-menu'])[3]/li[5]").click()
  $wait.until { $driver.find_element(:xpath,"(//a[@class='btn btn-warning btn-block btnDMPayNow'])[last()]").enabled? }
end

Then("User navigates to Takeaway orders > Home Delivery Page in POS application") do
  sleep 1
  $driver.switch_to.window($windowhandles[0])
  $driver.find_element(:xpath,"//ul[@class='nav tourTopNavigation']/li[6]/a").click()
  $driver.find_element(:xpath,"//ul[@class='dropdown-menu subMenuLocation']/li[1]/a").click()
  $wait.until { $driver.find_element(:xpath,"//a[@class='btnLocationSelection']/h2").displayed? }
  $driver.find_element(:xpath,"//a[@class='btnLocationSelection']/h2").click()
  $driver.find_element(:xpath,"(//ul[@class='dropdown-menu'])[3]/li[5]").click()
  $driver.find_element(:xpath,"//ul[@class='nav nav-pills pull-left']/li[2]").click()
  $wait.until { $driver.find_element(:xpath,"(//a[@class='btn btn-warning btn-block btnDMPayNow'])[last()]").enabled? }
end
