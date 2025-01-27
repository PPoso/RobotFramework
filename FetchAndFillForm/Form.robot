*** Settings ***
Library  SeleniumLibrary
Resource    NamePage.robot
Resource    FormPage.robot

Test Setup    Open Browser    ${url}    ${browser}
Test Teardown    Close Browser

*** Variables ***


*** Test Cases ***
Go through the form
    [Documentation]    Goes through the form using the most common first and last name. Finally checks the values.

    ${first_name}    ${last_name}    Fetch first and last name

    Open the formpage
    Fill and send the form    ${first_name}    ${last_name}
    Check the information on the form    ${first_name}    ${last_name}


