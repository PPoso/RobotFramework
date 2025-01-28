*** Settings ***
Library    SeleniumLibrary
Resource    MainPage.robot
Resource    AccountPage.robot

Test Setup        Open Browser    ${link}    ${browser}
Test Teardown    Close Browser

*** Variables ***

${link}    https://huutokaupat.com/
${browser}    chrome  

*** Test Cases ***

Navigate through Huutokaupat.com page and create an account
    Reject cookies
    Click make an account
    Create an account
