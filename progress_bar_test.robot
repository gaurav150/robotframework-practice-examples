*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To Progress Page
Suite Teardown    Close Browser

*** Variables ***
${URL}       https://demoqa.com/progress-bar
${BROWSER}   Chrome

*** Test Cases ***
Wait Until Progress Bar Reaches 100%
    Click Button    id=startStopButton
    Wait Until Keyword Succeeds    20s    1s    Progress Bar Should Be 100 Percent
    ${final}=    Get Text    css=.progress-bar
    Log    Progress bar final value: ${final}
    Should Be Equal As Strings    ${final}    100%

*** Keywords ***
Open Browser To Progress Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Progress Bar Should Be 100 Percent
    ${text}=    Get Text    css=.progress-bar
    Log    Current progress: ${text}
    Should Be Equal As Strings    ${text}    100%
