*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To Select Menu Page
Suite Teardown    Close Browser

*** Variables ***
${URL}        https://demoqa.com/select-menu
${BROWSER}    Chrome
${locator}    xpath=//div[@class=' css-yt9ioa-option' and text()='Prof.']

*** Test Cases ***
Test Select One Dropdown
    Click Element    xpath=//div[@id='selectOne']//div[contains(@class,'css-1hwfws3')]
    Wait Until Element Is Visible    ${locator}    timeout=10s
    Scroll Element Into View         ${locator}
    Sleep                            0.5s
    Click Element                    ${locator}
    Element Text Should Be           xpath=//div[@id='selectOne']//div[contains(@class,'singleValue')]    Prof.
    Log    ✅ Select One dropdown selected successfully.

*** Keywords ***
Open Browser To Select Menu Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
