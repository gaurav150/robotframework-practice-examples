#the full execution flow in one line :

#**Open browser → Run `Instant Alert Test` → Run `After 5 Seconds Alert Test` → Run `Confirm Alert Test` → Run `Prompt Alert Input Test` with `Gautam` → with `Alice` → with `123` → with `!@#$` → Close browser.**



*** Settings ***
Library    SeleniumLibrary
Library    Custom_libraries/alert_pop_up.py
#Resource     Custom_libraries/alert_pop_up.resource
Suite Setup    Open Browser To Alerts Page
Suite Teardown    Close Browser
#Test Teardown    Run Keyword And Ignore Error    Dismiss Alert

*** Variables ***
${URL}    https://demoqa.com/alerts
${BROWSER}    Safari

*** Test Cases ***

Instant Alert Test
    Click Button    id=alertButton
    Sleep    0.5s
    ${alert_text}=    Handle Alert    LEAVE
    Log    Alert text message is: ${alert_text}
    Handle Alert    ACCEPT

After 5 Seconds Alert Test
    Click Button    id=timerAlertButton
    Wait Until Alert Is Visible
    ${alert_text}=    Handle Alert    LEAVE
    Log    After 5 seconds alert text is: ${alert_text}
    Handle Alert    ACCEPT

Confirm Alert Test
    Click Button    id=confirmButton
    Handle Alert    ACCEPT
    Element Should Contain    id=confirmResult    Ok

Prompt Alert Test With Inputs
    [Template]    Prompt Alert Input Test
    Gautam
    Alice
    123
    !@#$

*** Keywords ***

Open Browser To Alerts Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Prompt Alert Input Test
    [Arguments]    ${input_text}
    Click Button    id=promtButton
    ${alert_text}=    Handle Alert    LEAVE
    Log    Prompt alert text is: ${alert_text}
    Input Text Into Alert    ${input_text}
    Element Should Contain    id=promptResult    ${input_text}
