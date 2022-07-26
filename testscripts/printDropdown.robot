*** Settings ***
Documentation  google page test
Library  OperatingSystem
Library  SeleniumLibrary
Suite Setup    Setup
Suite Teardown    Teardown

*** Variables ***
${BROWSER}    chrome
${URL}    https://techedtrainings.com/
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

    # Click on Contact
    Click Element    (//a[text()='Contact'])[1]
    # get the first column details
    ${dropDownElements}    Get WebElements    //select[@name='menu-363']/option
    FOR    ${eachElement}    IN    @{dropDownElements}
       ${elementText}  Get Text    ${eachElement}
       log to console    Dropdown Elements: ${elementText}
    END
