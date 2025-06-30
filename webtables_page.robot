*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Web Tables Page
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://demoqa.com/webtables
${BROWSER}    Chrome

*** Test Cases ***
Add And Search New User
    Click Element    css=#addNewRecordButton
    Add New User     John    Doe     john.doe@example.com    30    60000    Engineering
    Search User      John
    ${count}=        Get Row Count
    Should Not Be Equal As Integers    ${count}    0
    Verify User Exists    John    Doe

Add Multiple Users
    [Template]    Adding Multiple Users Using Template
    Alice   Smith   alice.smith@example.com   25    50000    Marketing
    Bob     Lee     bob.lee@example.com       28    55000    Sales
    

*** Keywords ***
Open Web tables Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Click Add User
    Click Button    id=addNewRecordButton

Add New User
    [Arguments]    ${firstName}    ${lastName}    ${email}    ${age}    ${salary}    ${department}
    Input Text    id=firstName    ${firstName}
    Input Text    id=lastName     ${lastName}
    Input Text    id=userEmail    ${email}
    Input Text    id=age          ${age}
    Input Text    id=salary       ${salary}
    Input Text    id=department   ${department}
    Click Button  id=submit

Search User
    [Arguments]    ${searchText}
    Input Text    id=searchBox    ${searchText}

Get Row Count
    ${rows}=    Get WebElements    css=div.rt-tr-group
    ${count}=   Get Length         ${rows}
    RETURN    ${count}

Verify User Exists
    [Arguments]    ${firstname}    ${lastname}
    ${user_row_text}=    Get Text    xpath=//div[contains(@class,'rt-tr-group')][contains(., '${firstname}') and contains(., '${lastname}')]
    Log    Found user row text: ${user_row_text}
    Should Contain    ${user_row_text}    ${firstname}
    Should Contain    ${user_row_text}    ${lastname}
    
Adding Multiple Users Using Template
    [Arguments]    ${firstname}    ${lastname}    ${email}    ${age}    ${salary}    ${department}
    Click Add User
    Add New User    ${firstname}    ${lastname}    ${email}    ${age}    ${salary}    ${department}
    Search User      ${firstname}
    ${count}=        Get Row Count
    Should Not Be Equal As Integers    ${count}    0
    Verify User Exists    ${firstname}   ${lastname}