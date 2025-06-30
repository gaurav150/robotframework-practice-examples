*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To Menu Page
Suite Teardown    Close Browser

*** Variables ***
${URL}                   https://demoqa.com/menu
${BROWSER}               Chrome

${MAIN_ITEM_2}           xpath=//a[text()='Main Item 2']
${SUB_SUB_LIST}          xpath=//a[text()='SUB SUB LIST »']
${SUB_SUB_ITEM_1}        xpath=//a[text()='Sub Sub Item 1']
${SUB_SUB_ITEM_2}        xpath=//a[text()='Sub Sub Item 2']

*** Test Cases ***
Hover Multilevel Menu
    Hover Over Menu Item    ${MAIN_ITEM_2}
    Hover Over Menu Item    ${SUB_SUB_LIST}
    Wait Until Element Is Visible    ${SUB_SUB_ITEM_1}    timeout=5s
    Wait Until Element Is Visible    ${SUB_SUB_ITEM_2}    timeout=5s
    ${item1}=    Get Text    ${SUB_SUB_ITEM_1}
    ${item2}=    Get Text    ${SUB_SUB_ITEM_2}
    Log    Found Sub Sub Item 1: ${item1}
    Log    Found Sub Sub Item 2: ${item2}
    Element Should Be Visible    ${SUB_SUB_ITEM_1}
    Element Should Be Visible    ${SUB_SUB_ITEM_2}

*** Keywords ***
Open Browser To Menu Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Hover Over Menu Item
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=5s
    Mouse Over    ${locator}
