*** Settings ***
Library    Collections

*** Variables ***
@{FRUITS}    Apple    Banana    Mango    Orange

*** Test Cases ***
List Operations Demo
    Log To Console    \nOriginal List: @{FRUITS}

    # Access elements
    Log To Console    First fruit: ${FRUITS}[0]
    Log To Console    Last fruit: ${FRUITS}[-1]

    # Append an item
    Append To List    ${FRUITS}    Papaya
    Log To Console    After appending: @{FRUITS}

    # Insert item at index
    Insert Into List    ${FRUITS}    2    Grapes
    Log To Console    After inserting at index 2: @{FRUITS}

    # ✅ Remove item by value (corrected)
    ${index}=    Get Index From List    ${FRUITS}    Banana
    Remove From List    ${FRUITS}    ${index}
    Log To Console    After removing Banana: @{FRUITS}

    # ✅ Remove item by index
    Log To Console    Before removing item at index 1: ${FRUITS}
    Remove From List    ${FRUITS}    1
    Log To Console    After removing item at index 1: @{FRUITS}

    # Replace item
    Set List Value    ${FRUITS}    0    Kiwi
    Log To Console    After replacing index 0 with Kiwi: @{FRUITS}

    # Check if item exists
    List Should Contain Value    ${FRUITS}    Mango
    List Should Not Contain Value    ${FRUITS}    Banana

    # Get list length
    ${length}=    Get Length    ${FRUITS}
    Log To Console    List length: ${length}

    # Loop through list
    FOR    ${fruit}    IN    @{FRUITS}
        Log To Console    Fruit: ${fruit}
    END

    # Sort list
    ${sorted}=    Copy List    ${FRUITS}
    Sort List    ${sorted}
    Log To Console    Sorted List: ${sorted}

    # Reverse list
    Reverse List    ${sorted}
    Log To Console    Reversed List: ${sorted}
