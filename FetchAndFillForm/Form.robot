*** Settings ***
Library  SeleniumLibrary
Resource    NamePage.robot
Resource    FormPage.robot

Test Setup    Open Browser    ${url}    ${browser}
Test Teardown    Close Browser

*** Variables ***


*** Test Cases ***
Go through the form
# Testitapauksessa robotti hakee nimipalveluista miehen yleisimmän etunimen sekä sukunimen ja käyttää
# näitä tallennettuja arvoja täyttääkseen w3s sivuston lomakkeen. Viimeiseksi tarkistaa, että sivu
# sisältää tämän tallennetun etu- ja sukunimen.
    [Documentation]    Käy lomakkeen läpi eri nimillä ja tarkistaa tuloksen.

    ${first_name}    ${last_name}    Fetch first and last name

    Open the formpage
    Fill and send the form    ${first_name}    ${last_name}
    Check the information on the form    ${first_name}    ${last_name}


