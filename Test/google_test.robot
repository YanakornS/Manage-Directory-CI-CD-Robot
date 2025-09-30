*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HUB_URL}    http://localhost:4444/wd/hub
${BROWSER}    chrome   

*** Test Cases ***
Test Google in Chrome
    [Documentation]    Test opening Google in Chrome through Selenium Grid
    Open Browser    http://www.google.com    ${BROWSER}    remote_url=${HUB_URL}
    Title Should Be    Google
    [Teardown]    Close Browser