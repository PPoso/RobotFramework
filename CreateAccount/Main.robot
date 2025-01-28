*** Settings ***
Library    SeleniumLibrary
Resource    MainPage.robot


*** Variables ***



*** Test Cases ***

Navigate through Huutokaupat.com page
    Reject cookies
    Make an account
