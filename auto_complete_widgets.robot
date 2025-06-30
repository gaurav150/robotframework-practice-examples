*** Settings ***
Library    SeleniumLibrary
Library    Custom_libraries/auto_complete_helpers.py
Suite Setup    Open Browser To AutoComplete Page
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://demoqa.com/auto-complete
${BROWSER}    Chrome

*** Test Cases ***

Single Auto Complete Test
    ${input}=    Find Child Input    id=autoCompleteSingleContainer    .//input
    Click Element    ${input}
    Input Text    ${input}    b
    Sleep    1s
    Click Suggestion With Text    Black

Multiple Auto Complete Test
    Click All Matching Suggestions    input#autoCompleteMultipleInput    b

*** Keywords ***
Open Browser To AutoComplete Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
