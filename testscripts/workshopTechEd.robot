*** Settings ***
Documentation  google page test
Library  OperatingSystem
Library  SeleniumLibrary
Suite Setup    Setup
Suite Teardown    Teardown

*** Variables ***
${BROWSER}     chrome
${URL}    https://techedtrainings.com/
${TITLE}  TechEd Trainings – IT Corporate Trainings
${phone_number}    xpath=(//div[@class="stm-iconbox__description"])[2]
${corporate_trainings}     css=rs-layer#slider-3-slide-5-layer-0 span
${industry_we_serve}     //h4[@class="infobox_title"]
${previous_arrow}     css=div.slick_prev i
${next_arrow}      css=div.slick_next i
*** Keywords ***
Setup chromedriver
  Set Environment Variable  webdriver.chrome.driver  C:\bin\chromedriver.exe
Setup
  Open Browser   about:blank    ${BROWSER}
  Maximize Browser Window
Teardown
   close browser

*** Test Cases ***
Teched01
    go to    ${URL}
    # to get the current page title
    ${current_page_title}     get title
    log to console    ${current_page_title}
    should be equal as strings    ${current_page_title}     ${TITLE}

    #validate phone number starts with +91
    ${phone}    get text    ${phone_number}
    log to console    ${phone}
    should start with  ${phone}    +91

    # validate the text IT Corporate Trainings
    wait until element is visible    ${corporate_trainings}
    ${trainings_text}     get text    ${corporate_trainings}
    log to console    getting text ${trainings_text}
    should be equal as strings    ${trainings_text}     IT Corporate Trainings

    # get the count of all industries we serve
    ${industries_count}    Get Element Count    ${industry_we_serve}
    log to console     total count of industries we serve${industries_count}

    #validate the first and last industry
    ${first_industry}      get text    (${industry_we_serve})[1]
    log to console    first industry   ${first_industry}
    should be equal as strings    IT Products & Services     ${first_industry}

    ${last_industry}      get text    (${industry_we_serve})[${industries_count} ]
    log to console    last industry   ${last_industry}
    should be equal as strings    Automotive    ${last_industry}

    #previous arrow click
    scroll element into view    ${previous_arrow}
    click element    ${previous_arrow}
    ${name}     get text    css=div.testimonial_inner div.info h6.no_stripe
    log to console    previous name ${name}
    sleep  3

    #next arrow click
    click element    ${next_arrow}
    ${next_name}     get text    css=div.testimonial_inner div.info h6.no_stripe
    log to console    next name ${next_name}
    sleep    3



