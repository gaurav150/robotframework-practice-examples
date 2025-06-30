*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To Tabs Page
Suite Teardown    Close Browser

*** Variables ***
${URL}         https://demoqa.com/tabs
${BROWSER}     Chrome

*** Test Cases ***
Tab Functionality Tests
    [Template]    Verify Tab Displays Correct Panel
    demo-tab-what      demo-tabpane-what
    demo-tab-origin    demo-tabpane-origin
    demo-tab-use       demo-tabpane-use

*** Keywords ***
Open Browser To Tabs Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Verify Tab Displays Correct Panel
    [Arguments]    ${tab_id}    ${panel_id}
    Click Element    id=${tab_id}
    Wait Until Element Is Visible    id=${panel_id}    5s
    Element Should Be Visible        id=${panel_id}
    ${text}=    Get Text    id=${panel_id}
    Log    ✅ Tab: ${tab_id} | Panel Text Preview: ${text[:50]}
