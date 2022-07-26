*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${appurl}       https://www.docker.com/
${browsername}    chrome
${expectedTitle}    Google

${expectedEmailPLaceHolder}     Email
${expectedCountryPlaceHolder}   Select Country


*** Test Cases ***
TC_001

    Open Browser    ${appurl}    ${browsername}

    # Maximize browser

    Maximize Browser Window
    
    # Mouse Over
    
    Mouse Over    (//a[text()='Products'])[1]
    Sleep    2

    Mouse Over    (//a[text()='Developers'])[1]
    Sleep    2

    Mouse Over    (//a[text()='About Us'])[1]
    Sleep    2

    

    # Scroll Till Subscribe
    
    Scroll Element Into View    //button[text()='Subscribe']

    Sleep   5




    Close All Browsers


