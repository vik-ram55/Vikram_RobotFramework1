*** Settings ***
Documentation  google page test
Library  OperatingSystem
Library  SeleniumLibrary
Library     DateTime
Suite Setup    Setup
Suite Teardown    Teardown

*** Variables ***
${BROWSER}    chrome
${URL}    https://testautomationpractice.blogspot.com/
${TITLE}   Automation Testing Practice


*** Keywords ***
Setup chromedriver
  Set Environment Variable  webdriver.chrome.driver  C:\bin\chromedriver.exe
Setup
  Open Browser   about:blank    ${BROWSER}
  Maximize Browser Window
Teardown
   close browser

*** Test Cases ***
TC_001
  [Documentation]  tables
  #Setup chromedriver
  go to    ${URL}

  # to get the current page title
  ${current_page_titile}     get title
  log to console    ${current_page_titile}
  should be equal as strings    ${current_page_titile}     ${TITLE}

  ${Tcol}    Get WebElements    //table[@name='BookTable']/tbody/tr[1]/th
  FOR    ${apple}    IN    @{Tcol}
    ${headerName}  Get Text    ${apple}
    log to console   header names ${headerName}
  END

  # Count Total Number Of Links ....
  ${Tcol}    Get WebElements    //a
  FOR    ${apple}    IN    @{Tcol}
    ${headerName}    Get Text    ${apple}
    log to console    link texts ${headerName}
  END

  # get the first column details
  ${booktable}    Get WebElements    //table[@name='BookTable']/tbody/tr/td[1]
  FOR    ${apple}    IN    @{booktable}
    ${headerName}  Get Text    ${apple}
    log to console    names ${headerName}
  END

  # To find 3000 value in HTML

  Table Column Should Contain    BookTable    4    3000

  # How to check Master Selenium in 5th row

  Table Row Should Contain    BookTable    5    Master In Selenium

  Table Header Should Contain    BookTable    Author

  Table Cell Should Contain    BookTable    7    3    Javascript
