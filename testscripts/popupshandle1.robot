*** Settings ***
Library     SeleniumLibrary
Resource  ../reusable/test_reusable.robot
Variables  ../reusable/pom.py
Test Setup  LaunchMyWebsite
Test Teardown   CloseMyWebsite


*** Variables ***

${expectedTitle}    Google
${text_to_enter}    VIKRAM

*** Test Cases ***
TC_001
    # Click for JS Alert

    Click Button    clickJSAlertBtn
    Sleep    5
    ${pop_up_text}  Handle Alert
    Log To Console    ${pop_up_text}

    # Validate the confirmation
    Element Text Should Be    result    You successfully clicked an alert
    Sleep    1


TC_002

    # Click for JS Confirm

    Click Button    //button[text()='Click for JS Confirm']
    Sleep    5
    ${pop_up_text}  Handle Alert
    Log To Console    ${pop_up_text}

    # Validate the confirmation
    Element Text Should Be    result    You clicked: Ok
    Sleep    1

TC_003


    # Click for JS Confirm

    Click Button    //button[text()='Click for JS Confirm']
    Sleep    5
    ${pop_up_text}  Handle Alert    action=DISMISS
    Log To Console    ${pop_up_text}

    # Validate the confirmation
    Element Text Should Be    result    You clicked: Cancel
    Sleep    1

TC_004

    # Click for JS Confirm

    Click Button    //button[text()='Click for JS Confirm']
    Sleep    5
    ${pop_up_text}  Handle Alert    action=ACCEPT
    Log To Console    ${pop_up_text}

    # Validate the confirmation
    Element Text Should Be    result    You clicked: Ok
    Sleep    1

TC_005

    # Click for JS Prompt

    Click Button    //button[text()='Click for JS Prompt']
    Sleep    5
    ${pop_up_text}  Handle Alert    action=ACCEPT
    Log To Console    ${pop_up_text}

    # Validate the confirmation
    Element Text Should Be    result    You entered:
    Sleep    1

TC_006


    # Click for JS Prompt

    Click Button    //button[text()='Click for JS Prompt']
    Sleep    5
    ${pop_up_text}  Handle Alert    action=DISMISS
    Log To Console    ${pop_up_text}

    # Validate the confirmation
    Element Text Should Be    result    You entered: null
    Sleep    1

TC_007


    # Click for JS Prompt

    Click Button    //button[text()='Click for JS Prompt']
    Sleep    5
    Input Text Into Alert    ${text_to_enter}   action=ACCEPT

    # Validate the confirmation
    Element Text Should Be    result    You entered: ${text_to_enter}
    Sleep    1




*** Keywords ***



