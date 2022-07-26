*** Settings ***
Documentation  google page test
Library  OperatingSystem
Library  SeleniumLibrary
Suite Setup    Setup
Suite Teardown    Teardown

*** Variables ***
${BROWSER}    chrome
${appurl}   https://the-internet.herokuapp.com/checkboxes
${appurl1}  https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/radio
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
    go to    ${appuRL}

    # Click on Contact
    Checkbox Should not Be Selected     (//input[@type='checkbox'])[1]

    Checkbox Should Be Selected     (//input[@type='checkbox'])[2]

    # Select Checkbox 1 & Validate

    Select Checkbox     (//input[@type='checkbox'])[1]
    Sleep   3

    Checkbox Should Be Selected  (//input[@type='checkbox'])[1]

    # Uncheck Checkbox 2

    Unselect Checkbox  (//input[@type='checkbox'])[2]

    sleep   3

    Checkbox Should not Be Selected     (//input[@type='checkbox'])[2]


TC_002
    [Documentation]  tables
    #Setup chromedriver
    go to    ${appurl1}



    # Click on Contact
    Checkbox Should not Be Selected     (//input[@type='checkbox'])[1]

    Checkbox Should Be Selected     (//input[@type='checkbox'])[2]

    # Select Checkbox 1 & Validate

    Select Checkbox     (//input[@type='checkbox'])[1]
    Sleep   3

    Checkbox Should Be Selected  (//input[@type='checkbox'])[1]

    # Uncheck Checkbox 2

    Unselect Checkbox  (//input[@type='checkbox'])[2]

    sleep   3

    Checkbox Should not Be Selected     (//input[@type='checkbox'])[2]

