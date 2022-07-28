*** Settings ***
Library     SeleniumLibrary
*** Variables ***

${appurl}       https://the-internet.herokuapp.com/javascript_alerts
${chrome_url}   https://www.google.com
${browsername}    chrome

*** Keywords ***

LaunchMyWebsite

    Open Browser    ${appurl}   ${browsername}

    # Maximize browser

    Maximize Browser Window


LaunchMyChromeWebsite

    Open Browser    ${chrome_url}   ${browsername}

    # Maximize browser

    Maximize Browser Window

CloseMyWebsite

    Close All Browsers
