*** Settings ***

Library     DateTime

*** Variables ***

*** Test Cases ***

TC_001
    ${today_date}   Get Current Date
    Log To Console  ${today_date}

    ${only_date}    Convert Date    ${today_date}  result_format=%a %B %d
    Log To Console  ${only_date}

    ${date_+_28}    Add Time to Date    ${today_date}   28 days
    Log To Console      28 days from today: ${date_+_28}

    ${date_minus_28}    Add Time to Date    ${today_date}   -28 days
    Log To Console      28 days back today: ${date_minus_28}

*** Keywords ***