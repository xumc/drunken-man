require "selenium-webdriver"

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "http://www.baidu.com"

element = driver.find_element(name: 'wd')
element.send_keys "Hello WebDriver!"
element.submit

puts driver.title

## execute arbitrary javascript
#puts driver.execute_script("return window.location.pathname")
#
## pass elements between Ruby and JavaScript
#element = driver.execute_script("return document.body")
#driver.execute_script("return arguments[0].tagName", element) #=> "BODY"
#
## wait for a specific element to show up
#wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
#wait.until { driver.find_element(id: "foo") }
#
## switch to a frame
#driver.switch_to.frame "some-frame" # id
#driver.switch_to.frame driver.find_element(id: 'some-frame') # frame element
#
## switch back to the main document
#driver.switch_to.default_content
#
## repositioning and resizing browser window:
#driver.manage.window.move_to(300, 400)
#driver.manage.window.resize_to(500, 800)
#driver.manage.window.maximize


driver.quit
