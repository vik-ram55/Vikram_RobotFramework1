*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${appurl}       https://www.google.com
${browsername}    chrome
${expectedTitle}    Google


*** Test Cases ***
TC_001

    Open Browser    ${appurl}    ${browsername}

    # Maximize browser

    Maximize Browser Window

    # Validate Google Logo

    Page Should Contain Element    //img[@alt='Google']

    validateGooglePageTitle
    validateGmailLink
    validateGoogleSearhTextBox
    validateGoogleSearchButton
    Close All Browsers

TC_002

    Open Browser    ${appurl}    ${browsername}

    # Maximize browser

    Maximize Browser Window
    # Validate Google Logo
    Page Should Contain Element    (//a[text()='Sign in'])[1]
    validateGooglePageTitle
    Close All Browsers

*** Keywords ***

validateGooglePageTitle

    # Validate Title

    ${runtimepagetitle}    Get Title
    Log To Console    ${runtimepagetitle}
    Should Be True    """${expectedTitle}""" == """${runtimepagetitle}"""

validateGmailLink

    # Validate Gmail Link

    Page Should Contain Element    //a[text()='Gmail']

validateGoogleSearhTextBox

    # Validate Google Search Text Box

    Page Should Contain Element    q


validateGoogleSearchButton

    # Validate Gmail Link

    Page Should Contain Element    btnK

