*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${declinebutton}    css:button#CybotCookiebotDialogBodyButtonDecline
${createbutton}    css:a[variant='default']                    

*** Keywords ***

Reject cookies
    Maximize Browser Window
    Wait Until Page Contains Element    ${declinebutton}    10s
    Click Button    ${declinebutton}

Click make an account
    Wait Until Page Contains Element   ${createbutton}
    Click link    ${createbutton}