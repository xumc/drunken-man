require "selenium-webdriver"
require "./log.rb"
require "./path.rb"
require "./deadlock_monitor.rb"

log = Log.new

deadLockMonitor = DeadlockMonitor.new(100)

driver = Selenium::WebDriver.for :chrome

startingPlace = ARGV[0]

driver.navigate.to startingPlace

while true do
    elements = driver.find_elements(xpath: '//a|//area').to_a

    if elements.count == 0
        log.info "there isn't any link in #{driver.current_url}"
        break
    end

    while true do
        element = elements.sample

        begin
            if element.displayed?
                tag = element.tag_name
                href = element.attribute('href')
                text = element.text

                path = Path.new(tag, href, text)

                log.info path.to_s
                deadLockMonitor.push(path)
                driver.navigate.to path.href
            end
            break
        rescue Selenium::WebDriver::Error::UnknownError => e
            log.error e.inspect
        end

        if deadLockMonitor.locked?
            log.Info("deadlock foun, restart from starting place")
            driver.navigate.to startingPlace 
        end
    end

    sleep 1
end

log.info driver.quit
log.close

