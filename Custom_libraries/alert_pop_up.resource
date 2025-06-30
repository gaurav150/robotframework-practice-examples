*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn

*** Keywords ***
Wait Until Alert Is Visible
    [Arguments]    ${timeout}=10    ${poll_frequency}=0.5
    ${end_time}=    Evaluate    __import__('time').time() + ${timeout}

    FOR    ${i}    IN RANGE    100
        ${current_time}=    Evaluate    __import__('time').time()
        Run Keyword If    ${current_time} > ${end_time}    Fail    Alert was not present after ${timeout} seconds.

        ${result}=    Run Keyword And Ignore Error    Get Alert Text
        Run Keyword If    '${result[0]}' == 'PASS'    RETURN

        Sleep    ${poll_frequency}
    END

