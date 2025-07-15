*** Settings ***
Library    SeleniumLibrary
Library    ChromeHelper.py
*** Test Cases ***
Test With Chrome Binary
    ${chrome_options}=    Get Chrome Options With Binary    D:/chrome-for-test/138.0.7204.92/chrome-win64/chrome.exe 
    Open Browser    https://www.google.com    chrome    options=${chrome_options}
    Title Should Be    Google
    Close Browser