*** Settings ***
Library     SeleniumLibrary


*** Variables ***

${appurl}       https://techedtrainings.com/
${browsername}    chrome
${expectedTitle}    Google
${prefix}   The Current URL is:

*** Test Cases ***

TechED_TC_001
    Open Browser    ${appurl}   ${browsername}
    Maximize Browser Window

    # Click on Contact
    Click Element    (//a[text()='Contact'])[1]

    # Wait till particular text is present in the website
    Wait Until Page Contains    Contact
    Wait Until Page Contains    info@techedtrainings.com

    # Type First Name
    Input Text    text-name    Vikram K
    Sleep    5

    # Print current page URL
    ${currentURL}  Get Location
    ${textToPrint}  Catenate    ${prefix}   ${currentURL}
    Log To Console    ${textToPrint}

    # Select dropdown : Subject

    Select From List By Value    menu-363   Data Science
    Sleep    3

    Select From List By Index    menu-363   2
    Sleep    3

    Select From List By Value   menu-363   Programming
    Sleep    3


    # Get total count of all links present in the webpage

    ${linkCount}    Get Element Count    //a
    Log To Console    ${linkCount}

    Close All Browsers

*** Keywords ***
