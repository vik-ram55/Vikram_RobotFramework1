*** Settings ***

Library     SeleniumLibrary
Library    ../reusable/reusable.py
Suite Setup     readXML
Suite Teardown   Close All Browsers




*** Variables ***
${browser}  chrome

*** Test Cases ***

TC_01

    Open Browser    ${application_path}     ${browser}
    Maximize Browser Window

*** Keywords ***

readXML

    ${chrome_path}      reusable.resdXMLAsPerNode    chromepath
    Set Global Variable    ${chrome_path}

    ${application_path}      reusable.resdXMLAsPerNode    applicationURL_cub
    Set Global Variable    ${application_path}
