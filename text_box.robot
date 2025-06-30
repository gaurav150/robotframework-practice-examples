*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To TextBox Page
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://demoqa.com/text-box
${BROWSER}    Chrome
${NAME_FIELD}             css=#userName
${EMAIL_FIELD}            css=#userEmail
${CURRENT_ADDRESS_FIELD}  css=#currentAddress
${PERMANENT_ADDRESS_FIELD}    css=#permanentAddress
${SUBMIT_BUTTON}          css=#submit

*** Test Cases ***
Fill Text Box With Multiple Data Sets
    [Template]    Fill The Form
    Rahul    abc@gmail.com      Karnataka     Uttarakhand
    Alice    alice@mail.com     Mumbai        Delhi
    John     john@site.com      Bangalore     Chennai

*** Keywords ***
Open Browser To TextBox Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fill The Form
    [Arguments]    ${name}    ${email}    ${curr_address}    ${perm_address}
    Input Text    ${NAME_FIELD}           ${name}
    Input Text    ${EMAIL_FIELD}          ${email}
    Input Text    ${CURRENT_ADDRESS_FIELD}    ${curr_address}
    Input Text    ${PERMANENT_ADDRESS_FIELD}  ${perm_address}
    Click Button    ${SUBMIT_BUTTON}
