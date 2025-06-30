*** Settings ***
Documentation    To Validate the LoginForm
Library    SeleniumLibrary

*** Variables ***
${URL}       https://rahulshettyacademy.com/loginpagePractise/


*** Test Cases ***
validate UnSuccessful Login
    [Tags]    UnsuccesfulAttempts
    Open the browser with the login page
    Fill the login form with invalid credentials
    Wait for error message and validate it
    Close Browser

*** Keywords ***
Open the browser with the login page
    Open Browser    ${URL}    Chrome
    Maximize Browser Window

Fill the login form with invalid credentials
    Input Text    id=username    rahulshettyacademy
    Input Password    id=password    learning1
    Click Button    id=signInBtn

Wait for error message and validate it
    Wait Until Element Is Visible    css=.alert-danger    timeout=5s
    Element Text Should Be           css=.alert-danger    Incorrect username/password.