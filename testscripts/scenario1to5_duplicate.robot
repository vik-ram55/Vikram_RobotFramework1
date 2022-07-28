*** Settings ***
Library     SeleniumLibrary
Library    ../reusable/reusable.py
Library    XML
Resource  ../reusable/test_reusable.robot
Variables  ../reusable/pom.py
Suite Setup     readXML
Test Setup      LaunchMyChromeWebsite
Suite Teardown   CloseMyWebsite


*** Variables ***

${expectedTitle}    Google
${text_to_enter}    VIKRAM

*** Test Cases ***

Test Case 1
    [Tags]      Scenario_1

    # Click for JS Alert
    goToArisGlobal
    validateArisGlobalTitle
    validateLogo
    validateHeader
#    validatePrimaryOptions
#
Test Case 2
    [Tags]      Scenario_2

    goToArisGlobal
    mouseOverLifeSphere
#    mouseOverLifeSphereMedicalAffairs
#    clickOnReporter
#    validateWatchTheVideoBtn
#
#Test Case 3
#    [Tags]      Scenario_3
#    goToArisGlobal
#
#
#
#
*** Keywords ***

readXML

    ${arisURL}      reusable.resdXMLAsPerNode    arisURL
    Set Global Variable    ${arisURL}

#    ${expectedArisTitle1}      reusable.resdXMLAsPerNode    expectedArisTitle1
#    Set Global Variable    ${expectedArisTitle1}
#
    ${expectedArisTitle2}      reusable.resdXMLAsPerNode    expectedArisTitle2
    Set Global Variable    ${expectedArisTitle2}

    ${expectedArisHeader}      reusable.resdXMLAsPerNode    expectedArisHeader
    Set Global Variable    ${expectedArisHeader}

    ${expectedOption1}      reusable.resdXMLAsPerNode    expectedOption1
    Set Global Variable    ${expectedOption1}
#
#    ${expectedOption2}      reusable.resdXMLAsPerNode    expectedOption2
#    Set Global Variable    ${expectedOption2}
#
#    ${expectedOption3}      reusable.resdXMLAsPerNode    expectedOption3
#    Set Global Variable    ${expectedOption3}
#
#    ${expectedOption4}      reusable.resdXMLAsPerNode    expectedOption4
#    Set Global Variable    ${expectedOption4}
#
#    ${expectedWatchVideoBtn}    reusable.resdXMLAsPerNode    expectedWatchVideoBtn
#    Set Global Variable    ${expectedWatchVideoBtn}


goToArisGlobal

    go to    ${arisURL}
    Sleep    5

validateArisGlobalTitle

    # Validate Title

    ${actualArisTitle}    Get Title
    Log To Console    ${actualArisTitle}
#    IF    """${expectedArisTitle1}""" == """${actualArisTitle}""" || """${expectedArisTitle2}""" == """${actualArisTitle}"""
#        Log To Console    Title Validation is Successfull
#    ELSE
#         Log To Console    Title Validation Failed
#    END
#    Should Be True    """${expectedArisTitle1}""" == """${actualArisTitle}""" OR """${expectedArisTitle2}""" == """${actualArisTitle}"""
     Should Be True    """${expectedArisTitle2}""" == """${actualArisTitle}"""
     Log To Console    Title Validation is Successful

validateLogo
     Page Should Contain Image    ${arisLogo}
     Log To Console    ArisGlobal Logo is displayed

validateHeader
       ${actualArisHeader}    get text    ${arisHeader}
       Should Be True    """${expectedArisHeader}""" == """${actualArisHeader}"""

       Log To Console    ArisGlobal Header Validation is Successful

#validatePrimaryOptions
#        ${actualOption1}     get text    ${primaryOption1}
#        Should Be True    """${expectedOption1}""" == """${actualOption1}"""
#
#        ${actualOption2}     get text    ${primaryOption2}
#        Should Be True    """${expectedOption2}""" == """${actualOption2}"""
#
#        ${actualOption3}     get text    ${primaryOption3}
#        Should Be True    """${expectedOption3}""" == """${actualOption3}"""
#
#        ${actualOption4}     get text    ${primaryOption4}
#        Should Be True    """${expectedOption4}""" == """${actualOption4}"""
#
#        Log To Console    Primary Option Validation is successful
#
mouseOverLifeSphere

    Mouse Over    ${primaryOption1}
    Sleep    2
    Log To Console    Performed Mouse Over on LifeSphere

mouseOverLifeSphereMedicalAffairs

    Mouse Over    ${lifeSphereMedicalAffairs}
    Sleep    2
    Log To Console    Performed Mouse Over on LifeSphere Medical Affairs

clickOnReporter
    Click Element   ${reporter}
    Sleep   5
    Log To Console    Clicked on Reporter

validateWatchTheVideoBtn
    ${actualWatchTheVideoBtn}    get text    ${watchTheVideoBtn}
    Should Be True    """${expectedWatchVideoBtn}""" == """${actualWatchTheVideoBtn}"""
    Log To Console    Watch the Video Button Validation is successful