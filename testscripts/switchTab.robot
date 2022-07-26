*** Settings ***

Library    SeleniumLibrary

*** Variables ***

${appurl}   https://www.google.com
${browsername}   chrome
${expectedTitle}     Google


*** Test Cases ***

TC_001

    Open Browser    ${appurl}   ${browsername}
    Maximize Browser Window

    ${pagetitle}    Get Title
    Log To Console    ${pagetitle}

     # How to open a new TAB using Robot?

    Execute Javascript  window.open()

     # Switch To the new Window....

     Switch Window   locator=NEW

     # How to open an URL in the new TAB

       Go To    https://www.twitter.com
       Sleep    10

    ${pagetitle}    Get Title
    Log To Console    ${pagetitle}

       # How to close the new TAB

       Close Window
       Sleep    5

     # Come back to parent TAB

     Close All Browsers