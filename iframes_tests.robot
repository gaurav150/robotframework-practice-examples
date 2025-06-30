*** Settings ***
Library    SeleniumLibrary
Library    Custom_libraries/iframes_tests.py
Suite Setup    Open Browser To Frames Page
Suite Teardown    Close Browser

*** Variables ***
${URL}        https://demoqa.com/frames
${BROWSER}    Chrome

*** Test Cases ***

Verify Page Title
    [Tags]    hello
    ${title}=    Get Title
    Title Should Be    DEMOQA
    Log    Page Title: ${title}

Verify Main Page Text And Write To File
    ${main_heading}=    Get Text    tag:h1
    Log    Main Frame Text: ${main_heading}

    ${paragraph}=    Get Text    xpath://div[contains(text(),'Sample Iframe page There are 2 Iframes')]
    Log    Paragraph Text: ${paragraph}
# write text to file is a custom keyword
    Write Text To File    iframe_paragraph.txt    ${paragraph}

Verify First Frame Text
    Select Frame    id=frame1
    ${frame_text}=    Get Text    id=sampleHeading
    Log    Text in Frame 1: ${frame_text}
    Should Be Equal    ${frame_text}    This is a sample page
    Unselect Frame

Verify Second Frame Text
    Select Frame    id=frame2
    ${frame_text}=    Get Text    id=sampleHeading
    Log    Text in Frame 2: ${frame_text}
    Should Be Equal    ${frame_text}    This is a sample page
    Unselect Frame

*** Keywords ***

Open Browser To Frames Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
