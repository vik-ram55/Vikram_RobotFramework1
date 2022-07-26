*** Settings ***
Documentation  google page test
Library  OperatingSystem
Library  SeleniumLibrary
Suite Setup    Setup
Suite Teardown    Teardown

*** Variables ***
${BROWSER}    chrome
${appurl}   https://codepen.io/RobotsPlay/pres/pyNLdL
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
    Sleep    3

    # Click on
    Select Frame    result
    Click Element    //label[@class='dropdown-label']
    Sleep   5
    # Check first 3 checkboxes
    Click Element    //input[@value='Selection 1']
    Checkbox Should Be Selected     //input[@value='Selection 1']
    Sleep   1
    Click Element    //input[@value='Selection 2']
    Checkbox Should Be Selected     //input[@value='Selection 2']
    Sleep   1
    Click Element    //input[@value='Selection 3']
    Checkbox Should Be Selected     //input[@value='Selection 3']
    Sleep   1

    # Uncheck last 2 checkboxes

    Click Element    //input[@value='Selection 2']
    Checkbox Should not Be Selected     //input[@value='Selection 2']
    Sleep   1
    Click Element    //input[@value='Selection 3']
    Checkbox Should not Be Selected     //input[@value='Selection 3']
    Sleep   1


