*** Settings ***
Library    SeleniumLibrary
Library    String


*** Variables ***
${emailbox}    css:input[type=email]


*** Keywords ***
Create an account
    ${email}    Generate Random String    8    0123456789abcdefghijklmnopqrstuwxyz
    Wait Until Page Contains Element    ${emailbox}
    Input Text    ${emailbox}    ${email}@gmail.com
    Sleep    5s
    
     