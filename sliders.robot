*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To Slider Page
Suite Teardown    Close Browser

*** Variables ***
${URL}       https://demoqa.com/slider
${BROWSER}   Chrome

*** Test Cases ***
Move Slider Using Offset
    ${slider}=    Get WebElement    xpath=//input[@type='range']
    ${before}=    Get Element Attribute    ${slider}    value
    Log    Value before moving: ${before}

    Drag And Drop By Offset    xpath=//input[@type='range']    59    0
    ${after}=    Get Element Attribute    ${slider}    value
    Log    Value after moving: ${after}
    Should Not Be Equal As Strings    ${before}    ${after}

*** Keywords ***
Open Browser To Slider Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
