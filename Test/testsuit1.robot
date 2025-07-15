*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot
Resource   ../resources/keywords.robot





*** Test Cases ***
Search Google and Verify Results TC1001
    [Documentation]    Test case to search Google and verify results
    [Tags]    search
    Open Google
    Input Search Term
    Enter Google Search
    Wait Until Page Contains    ${SEARCH_RESULT1}    timeout=10s
    Sleep    5s
    Verify Search Results
    Capture Page Screenshot With Name    TC1001
    Close Browser


Search Google and Verify Results TC1002
    [Documentation]    Test case to search Google and verify results
    [Tags]    search
    Open Google
    Input Search Term 2
    Enter Google Search
    Wait Until Page Contains    ${SEARCH_RESULT1}    timeout=10s
    Sleep    5s
    Verify Search Results 2
    Capture Page Screenshot With Name    TC1002
    Close Browser

Search Check Title TC10010
    [Documentation]    Test case to search Google and verify results
    [Tags]    Check
    Open Google
    Title Should Be    Google
    Capture Page Screenshot With Name    TC10010
    Close Browser
