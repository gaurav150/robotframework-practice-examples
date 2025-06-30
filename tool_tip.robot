*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To Tooltip Page
Suite Teardown    Close Browser

*** Variables ***
${URL}        https://demoqa.com/tool-tips
${BROWSER}    Chrome

*** Test Cases ***
Verify Tooltip On Button
    Hover Over And Verify Tooltip    id=toolTipButton

Verify Tooltip On Text Field
    Hover Over And Verify Tooltip    id=toolTipTextField

Verify Tooltip On "Contrary"
    Hover Over And Verify Tooltip    xpath=//a[text()='Contrary']

Verify Tooltip On "1.10.32"
    Hover Over And Verify Tooltip    xpath=//a[text()='1.10.32']

*** Keywords ***
Open Browser To Tooltip Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Hover Over And Verify Tooltip
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Mouse Over    ${locator}
    Wait Until Element Is Visible    css=div.tooltip-inner    timeout=5s
    ${tooltip}=    Get Text    css=div.tooltip-inner
    Log    Tooltip Text: ${tooltip}
    Should Not Be Empty    ${tooltip}
