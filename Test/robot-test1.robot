*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Test With Chrome
    ${chrome_options}=    Create Dictionary
    ...    binary_location=D:/chrome-for-test/138.0.7204.92/chrome-win64/chrome.exe 
    ...    args=--no-sandbox,--disable-dev-shm-usage
    
    ${desired_caps}=    Create Dictionary    chromeOptions=${chrome_options}
    
    Open Browser    https://www.instagram.com/   chrome    desired_capabilities=${desired_caps}
    Close Browser