*** Settings ***
Library  SeleniumLibrary
Resource    Nimihaku.robot
Resource    Form.robot

Test Setup    Open Browser    ${url}    ${selain}
Test Teardown    Close Browser

*** Variables ***


*** Test Cases ***
Käy lomake lävitse
# Testitapauksessa robotti hakee nimipalveluista miehen yleisimmän etunimen sekä sukunimen ja käyttää
# näitä tallennettuja arvoja täyttääkseen w3s sivuston lomakkeen. Viimeiseksi tarkistaa, että sivu
# sisältää tämän tallennetun etu- ja sukunimen.
    [Documentation]    Käy lomakkeen läpi eri nimillä ja tarkistaa tuloksen.

    ${etunimi}    ${sukunimi}    Hae Etunimi Ja Sukunimi

    Avaa Lomakesivu
    Täytä Ja Lähetä Lomake    ${etunimi}    ${sukunimi}
    Tarkista Lomakkeen Lähetys    ${etunimi}    ${sukunimi}


