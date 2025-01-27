*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${declinebutton}    css:button#CybotCookiebotDialogBodyButtonDecline
${createbutton}    css:a[variant='default']   
${link}    https://huutokaupat.com/
${browser}    chrome                     

*** Keywords ***

Edit cookies
    Open Browser    ${link}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains Element    ${declinebutton}    10s
    Click Button    ${declinebutton}

Make an account
    Wait Until Page Contains Element   ${createbutton}
    Click link    ${createbutton}
    Close Browser