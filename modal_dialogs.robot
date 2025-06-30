*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To Modal Page
Suite Teardown    Close Browser

*** Variables ***
${URL}         https://demoqa.com/modal-dialogs
${BROWSER}     Chrome

*** Test Cases ***

Verify Page Title and Heading
    ${title}=    Get Title
    Log    Page Title: ${title}
    Title Should Be    DEMOQA
    Element Should Contain    tag:h1    Modal Dialogs

Verify Modal Wrapper Text
    ${wrapper_text}=    Get Text    css:div[id='modalWrapper'] div div
    Log    Modal Wrapper text: ${wrapper_text}
    Should Not Be Empty    ${wrapper_text}

Verify Small Modal Dialog
    Click Button    id:showSmallModal
    Sleep    1s
    ${heading}=    Get Text    id:example-modal-sizes-title-sm
    Log    Small Modal Heading: ${heading}
    Should Not Be Empty    ${heading}
    ${body}=    Get Text    css:.modal-body
    Log    Small Modal Body: ${body}
    Should Not Be Empty    ${body}
    Click Button    id:closeSmallModal
    Sleep    1s

Verify Large Modal Dialog
    Click Button    id:showLargeModal
    Sleep    1s
    ${heading}=    Get Text    css:.modal-header
    Log    Large Modal Heading: ${heading}
    Should Not Be Empty    ${heading}
    ${body}=    Get Text    tag:p
    Log    Large Modal Body: ${body}
    Should Not Be Empty    ${body}
    Click Button    id:closeLargeModal
    Sleep    1s

*** Keywords ***

Open Browser To Modal Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
