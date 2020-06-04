require 'selenium-webdriver'
require 'yaml'




Before do
  
  #Pre requisite
  $data = YAML.load_file('C:/Man/SapaadWebAutomation/Config/CRM_testdata.yml')
  $DineIndata = YAML.load_file('C:\Man\SapaadWebAutomation\Config\DineIn_testdata.yml')
  $OnlineHomeDelivery = YAML.load_file('C:\Man\SapaadWebAutomation\Config\OnlineHomeDelivery_testdata.yml')
  
  $wait = Selenium::WebDriver::Wait.new(:timeout => 10)

  #Invoking the Selenium-Chrome driver
  Selenium::WebDriver::Chrome::Service.driver_path="D:/chromedriver/chromedriver.exe"
  $driver = Selenium::WebDriver.for :chrome
  
  #
  $driver.get "http://pos-review.sapaad.com/"
  $driver.manage.window.maximize
  $wait.until { $driver.find_element(:id, 'user_email').displayed? }
  end 
  
  After do
    $driver.quit
  end