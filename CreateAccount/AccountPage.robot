*** Settings ***
Library    SeleniumLibrary
Library    String


*** Variables ***
${emailbox}    css:input[type=email]
${number}    css:input[type=phoneNumber]
${numberstart}    +35844
${password}    css:input[type=password]
${passwordagain}    css:input[name="passwordAgain"]
${address}    css:input[name="address"]
${zipcode}    css:input[name="zipcode"]
${city}    css:input[name="city"]
${submit}    css:button.chakra-button.forge-button--reset.forge-button.hk-1yltt2q


*** Keywords ***
Create an account
    [Documentation]    Generates a random email, number, and password and uses the values provided to create an account.
    ${randomemail}    Generate Random String    8    0123456789abcdefghijklmnopqrstuwxyz
    ${randomnumber}    Generate Random String    7    0123456789
    ${randompassword}    Generate Random String    12    0123456789abcdefghijklmnopqrstuwxyz!"#¤%&/    
    Wait Until Page Contains Element    ${emailbox}
    Input Text    ${emailbox}    ${randomemail}@gmail.com
    Input Text    ${number}    ${numberstart}${randomnumber}
    Input Password    ${password}    ${randompassword}
    Input Password    ${passwordagain}    ${randompassword}
    Input Text    ${address}    Testaajankuja 404
    Input Text    ${zipcode}    00820
    Click Element    ${city}
    Wait Until Page Contains Element    ${submit}
    Click Button    ${submit}
    Log    ${randomemail}
    Log    ${randomnumber}
    Log    ${randompassword}       
    
     