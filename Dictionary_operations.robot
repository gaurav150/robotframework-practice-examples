*** Settings ***
Library    Collections

*** Variables ***
&{USER}     name=John    age=30    city=Delhi

*** Test Cases ***
Dictionary Operations Demo
    Log To Console    \nOriginal Dictionary: &{USER}

    # Access values
    Log To Console    Name: ${USER}[name]
    Log To Console    Age: ${USER}[age]

    # Add a new key-value
    Set To Dictionary    ${USER}    email=john@example.com
    Log To Console    Added email: ${USER}[email]

    # Update existing key
    Set To Dictionary    ${USER}    age=31
    Log To Console    Updated Age: ${USER}[age]

    # Delete a key
    Remove From Dictionary    ${USER}    city
    Log To Console    Dictionary after deleting city: &{USER}

    # Check if key exists
    Dictionary Should Contain Key    ${USER}    name
    Dictionary Should Not Contain Key    ${USER}    city

    # Loop through dictionary keys and values
    FOR    ${key}    IN    @{USER.keys()}
        Log To Console    Key: ${key} | Value: ${USER}[${key}]
    END

    # Get all keys and values
    ${keys}=    Get Dictionary Keys    ${USER}
    ${values}=  Get Dictionary Values  ${USER}
    Log To Console    Keys: ${keys}
    Log To Console    Values: ${values}

    # Get dictionary length
    ${length}=  Get Length    ${USER}
    Log To Console    Dictionary length: ${length}
